#Force a full sync of device
#Taken from here
# https://www.jeffgilb.com/use-intune-to-force-an-update-compliance-full-census-sync/
#Copyright of respective owner

$sysdir = [System.Environment]::SystemDirectory
$regpath = “HKLM:Software\Microsoft\Windows\CurrentVersion\Census”


Set-ItemProperty $regpath FullSync 1
Start-Process -FilePath “devicecensus.exe” -WorkingDirectory $sysdir | Out-Null
Remove-ItemProperty $regpath FullSync

