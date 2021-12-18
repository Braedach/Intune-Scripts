<#

    AUDIT FIREWALL POLICIES ENABLE FOR MSDE REPORTING

    References:
        https://docs.microsoft.com/en-us/microsoft-365/security/defender-endpoint/host-firewall-reporting?view=o365-worldwide
        https://docs.microsoft.com/en-us/windows/win32/fwp/auditing-and-logging
        https://security.microsoft.com/firewall?viewid=firewallInbound

#>



try
    {
    auditpol /set /subcategory:"Filtering Platform Packet Drop" /failure:enable
    auditpol /set /subcategory:"Filtering Platform Connection" /failure:enable
    Write-Host "Firewall reporting set" -ForegroundColor Green
    }

catch
    {
    Write-Host "Firewall reporting policy failed" -ForegroundColor Red
    }
