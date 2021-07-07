#Powershell Script To remove Interner Explorer
#Check If remove Interner Explorer Are Already Installed

$check = Get-WindowsOptionalFeature -Online | Where-Object {$_.FeatureName -eq "Internet-Explorer-Optional-amd64"}
If ($check.State -ne "Disabled") 
{
        #Remove Internet Explorer
        Disable-WindowsOptionalFeature -FeatureName Internet-Explorer-Optional-amd64 -Online -NoRestart | Out-Null
}

