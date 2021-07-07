<#
  The following code was taken from here
  https://tech.nicolonsky.ch/onedrive-automountteamsites/

  This setting lets you specify SharePoint team site libraries to sync automatically the next time users sign in to the OneDrive sync client. (Microsoft)

  Not currently used but I was interested enough to save the script.  Current solution uses MDM
  Obviously you would have multiple version of these scripts set against certain user groups.



#>

$tenantAutoMountRegKey="HKLM:\SOFTWARE\Policies\Microsoft\OneDrive\TenantAutoMount"

$autoMountTeamSitesList= @{
    
    #Enter yyour SharePoint libraries to configure here as key/value pairs
    DemoTeamSite="Enter your encoded SharePoint library ID here"
}


if (-not (Test-Path $tenantAutoMountRegKey)){
    
    New-Item -Path $tenantAutoMountRegKey -Force

}


#add registry entries from the hashtable above
$autoMountTeamSitesList.GetEnumerator() | ForEach-Object {
        
    Set-ItemProperty -Path $tenantAutoMountRegKey -Name $PSItem.Key -Value $PSItem.Value -ErrorAction Stop
}