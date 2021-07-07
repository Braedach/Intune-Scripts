<#

Setting registry key to block AAD Registration to 3rd party tenants.
Taken from here - https://msendpointmgr.com/2021/03/11/are-you-tired-of-allow-my-organization-to-manage-my-device/
Created 30-03-2021
 
#>


$RegistryLocation = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WorkplaceJoin\"
$keyname = "BlockAADWorkplaceJoin"

#Test if path exists and create if missing
if (!(Test-Path -Path $RegistryLocation))
    {
    Write-Output "Registry location missing. Creating"
    New-Item $RegistryLocation | Out-Null
    }

#Force create key with value 1 
New-ItemProperty -Path $RegistryLocation -Name $keyname -PropertyType DWord -Value 1 -Force | Out-Null
Write-Output "Registry key set"