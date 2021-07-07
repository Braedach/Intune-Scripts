<#

Setup Auto update on Google Chrome
Test to see if it is installed using the key defined by MSDE Software evidence
Delete the previous key if in existance to allow for a complete refresh of that registry key
Recreate the key properly iaw guideance gained from Chrome and the GP Policy installed and configured via ADMX
Updated 01-04-2021

#>

If (Test-Path -Path 'Registry::HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{2EE8C646-3C78-392B-8D11-220908787966}')
    {
    #If the key already exists just set the value
    Write-Output "True Google Chrome Installed"
    
    If (Test-Path -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update')
        {
        #If the key already exists delete the value and start again
        Write-Output "True the Update key already exists - Delete the key to allow for a complete refresh"
        Remove-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update'
       
        }
        else
        {
         Write-Output "True the Update key doesnt exist - create and edit it"
        }
        #Rebuild the key and its entries
        Write-Output "Rebuilding the Google Update keys"
        New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update'
        New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update' -Name 'Updatedefault' -value '3'
        New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update' -Name 'AutoUpdateCheckPeriodMinutes' -value '120'
        New-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update' -Name 'Update{8A69D345-D564-463C-AFF1-A69D9E530F96}' -value '1'
        Get-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Google\Update'
    }
    else
    {
     ##If the key doesnt exist then the program is not installed and doesnt need rectification
     Write-Output "False Google Chrome not installed"
     }

