#Fix LSA for joined machines and set prerequisites for advanced auditing controls
#Create or modify the registry keys no matter what
#Test machine had second key - other test machine did not have second key and is required.
#created based on research 05-03-2021


If (Test-path -Path 'Registry::HKLM\SYSTEM\CurrentControlSet\Control\Lsa\')
    {
    #If the key already exists just set the value
    Write-Output "True"
    Set-Itemproperty -Path Registry::HKLM\SYSTEM\CurrentControlSet\Control\Lsa\ -Name 'RunAsPPL' -value '1'
    Set-ItemProperty -Path Registry::HKLM\SYSTEM\CurrentControlSet\Control\Lsa\ -Name 'SCENoApplyLegacyAuditPolicy' -value '1'
    }
    else
    {
    Write-Output "False"
    }

