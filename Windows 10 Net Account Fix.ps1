<#
Test configuration for solving the account problems in net
Original source code here

https://github.com/TristanvanOnselen/WorkplaceAsCode/blob/master/ProActive_Remediation/Remediate_WorkplaceHardening.ps1
https://www.stigviewer.com/stig/windows_8/2013-10-01/finding/V-36772

The following commands have been left to their default
net accounts /lockoutduration:30
net accounts /lockoutwindow:30

#>       
        
        
        
try
    {        
        #Fix the Accounts issue in MSDE Security portal
        net accounts /lockoutthreshold:10
        net accounts /minpwlen:14
        net accounts /uniquepw:24
        }

catch{
    $errMsg = $_.Exception.Message
    Write-Error $errMsg
    exit 1
    }