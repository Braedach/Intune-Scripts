
#Windows 10 Disable Installation and configuration of Network Bridge on your DNS domain network
#Test to see if the key exists, if it does change it, if it doesnt do nothing - not installed
#Updated 28-03-2021


$regpath = “Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\Network Connections"

If (Test-Path -Path $regpath)
    {
    #If the key already exists just set the value
    Write-Output "True Windows Network Policy Key exists"
    If (Test-Path -Path $regpath)
        {
        #If the key already exists just modify the value
        Write-Output "True the key already exists - modify the value"
        Set-ItemProperty -Path $regpath -Name 'NC_AllowNetBridge_NLA' -value '0'
        Get-ItemProperty -Path $regpath
       
        }
        else
        {
         Write-Output "True the key doesnt exist - create and edit it"
         New-Item -Path $regpath
         New-ItemProperty -Path $regpath -Name 'NC_AllowNetBridge_NLA' -value '0'
         Get-ItemProperty -Path $regpath
        }
    }
    else
    {
     ##If the key doesnt exist then the program is not installed and doesnt need rectification
     Write-Output "False Windows Network Policy Key doesnt exist"
     New-Item -Path $regpath
     New-ItemProperty -Path $regpath -Name 'NC_AllowNetBridge_NLA' -value '0'
     Get-ItemProperty -Path $regpath
     }