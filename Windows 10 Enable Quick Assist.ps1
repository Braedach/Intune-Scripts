#Remediation for Enable Offer Remote Assistance
#Call the registry value to see if exists, if so set the value, if not create the value
#Updated 30-03-2021


If (Get-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\')
    {
    #If the key already exists just set the value
    Write-Output "True"
    Write-Output "Settings before"
    Get-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\'
    Set-Itemproperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\' -Name 'fAllowUnsolicited' -value '1'
    Set-Itemproperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\' -Name 'fAllowToGetHelp' -value '1'
    Set-Itemproperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\' -Name 'fAllowUnsolicitedFullControl' -value '1'
    Write-Output "Settings After"
    Get-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\'
   
    }
    else
    {
     #If the key doesnt exist then the program is not installed and doesnt need rectification
     Write-Output "False"
    
    }

