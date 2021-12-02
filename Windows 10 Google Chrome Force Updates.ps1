<#

Setup Auto update on Google Chrome
Test to see if it is installed using the key defined by MSDE Software evidence
Delete the previous key if in existance to allow for a complete refresh of that registry key
Recreate the key properly iaw guideance gained from Chrome and the GP Policy installed and configured via ADMX
Updated 21-07-2021

#>

If (Test-Path -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe')
    {
    #If the key already exists just set the value
    Write-Output "True Google Chrome Installed"
    
    If (Test-Path -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update')
        {
        #If the key already exists delete the value and start again
        Write-Output "True the Update key already exists - Delete the key to allow for a complete refresh"
        Remove-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update' -Force
       
        }
        else
        {
         Write-Output "True the Update key doesnt exist - create and edit it"
        }
        #Rebuild the key and its entries
        Write-Output "Rebuilding the Google Update keys"
        New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update'
        New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update' -Name 'AutoUpdateCheckPeriodMinutes' -type Dword -value '00000078'
        New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update' -Name 'CloudPolicyOverridesPlatformPolicy' -type Dword -value '00000001'
        New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update' -Name 'UpdateDefault' -type Dword -value '00000001'
        New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update' -Name 'InstallDefault' -type Dword -value '00000001'
        Get-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update'
    }
    else
    {
     ##If the key doesnt exist then the program is not installed and doesnt need rectification
     Write-Output "False Google Chrome not installed"
     }

