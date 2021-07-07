#Setup Enable Local Admin password Management
#Call the registry value at and then set the value
#Created 28-01-2021


If (Get-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft Services\AdmPwd\')
    {
    #If the key already exists just set the value
    Write-Output "True"
    Set-Itemproperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft Services\AdmPwd\' -Name 'AdmPwdEnabled' -value '1'
    Get-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft Services\AdmPwd\' -Name AdmPwdEnabled
    }
    else
    {
     #If the key doesnt exist create it and set the value
     Write-Output "False"
     New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft Services\'
     New-Item -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft Services\AdmPwd\'
     New-Itemproperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft Services\AdmPwd\' -Name 'AdmPwdEnabled' -value '1' -Force
     Get-ItemProperty -Path 'Registry::HKLM\SOFTWARE\Policies\Microsoft Services\AdmPwd\'
     }
