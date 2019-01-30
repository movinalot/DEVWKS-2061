# ex-08.ps1
# Compare / Sync
$ucsCred = Get-Credential
$ucsSource = Connect-Ucs -Name 198.18.133.91 -Credential $ucsCred –NotDefault
$ucsTarget = Connect-Ucs -Name 198.18.134.249 -Credential $ucsCred –NotDefault

Compare-UcsMo $(Get-UcsVlan -Ucs $ucsTarget) $(Get-UcsVlan -Ucs $ucsSource)

Sync-UcsMo -Ucs $ucsTarget $(Compare-UcsMo $(Get-UcsVlan -Ucs $ucsTarget) $(Get-UcsVlan -Ucs $ucsSource)) -WhatIf –DeleteNotPresent