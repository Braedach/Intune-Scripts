<#
  Add new ASR Rule that is not implemented via MEM ASR
  See here: https://docs.microsoft.com/en-us/microsoft-365/security/defender-endpoint/enable-attack-surface-reduction?view=o365-worldwide#powershell

  To enable ASR Block abuse of exploited vulnerable signed drivers
  Deployed 2021-07-26

  This is a good test case for proactive remediation.  Update the ASR as well to reflect new rule.

#>

Add-MpPreference -AttackSurfaceReductionRules_Ids 56a863a9-875e-4185-98a7-b882c64b5ce5 -AttackSurfaceReductionRules_Actions Audit