<# ex-03.ps1

Purpose:
    UCS Manager Help and Session information example
Author:
    John McDonough (jomcdono@cisco.com) github: (@movinalot)
    Cisco Systems, Inc.
#>

$(Get-Help Connect-Ucs)

Import-Module Cisco.UCSManager

$creds = new-object -typename System.Management.Automation.PSCredential `
    -argumentlist "admin",$(convertto-securestring -Force -AsPlainText "Nbv12345")

$ucsm_ip = "10.10.20.40"

Connect-Ucs -Name $ucsm_ip -Credential $creds

Write-Host -ForegroundColor Black -BackgroundColor White '$DefaultUcs Value'
$DefaultUcs

Write-Host -ForegroundColor Black -BackgroundColor White 'Get-UcsPsSession Value'
Get-UcsPsSession

Disconnect-Ucs

Write-Host -ForegroundColor Black -BackgroundColor White 'Get-UcsPsSession and $DefaultUcs Value after Disconnect-Ucs'
Get-UcsPsSession
$DefaultUcs