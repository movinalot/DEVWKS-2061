<# ex-08.ps1

Purpose:
    UCS Manager Compare and Sync example
Author:
    John McDonough (jomcdono@cisco.com) github: (@movinalot)
    Cisco Systems, Inc.
#>
# Compare / Sync

Import-Module Cisco.UCSManager

$creds = new-object -typename System.Management.Automation.PSCredential `
    -argumentlist "admin",$(convertto-securestring -Force -AsPlainText "Nbv12345")

$source_ucsm_ip = "198.18.133.91"
$target_ucsm_ip = "198.18.134.249"

$ucsSource = Connect-Ucs -Name $source_ucsm_ip -Credential $creds -NotDefault
$ucsTarget = Connect-Ucs -Name $target_ucsm_ip -Credential $creds -NotDefault

Compare-UcsMo $(Get-UcsVlan -Ucs $ucsTarget) $(Get-UcsVlan -Ucs $ucsSource)

Sync-UcsMo -Ucs $ucsTarget $(Compare-UcsMo $(Get-UcsVlan -Ucs $ucsTarget) $(Get-UcsVlan -Ucs $ucsSource)) -WhatIf -DeleteNotPresent

Disconnect-Ucs