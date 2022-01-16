<#

    Remove Miscellaneous vunerabilities from the system in accordance with the following

    Reference:
        NESSUS Vunerability scanning
        Greenbone Vunerability scanning

    Created 16-01-2022




#>



try
    {  
    netsh int tcp set global timestamps=disabled
    }

catch
    {
    $errMsg = $_.Exception.Message
    Write-Error $errMsg
    exit 1
    }