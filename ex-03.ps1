# ex_03.ps1
Get-Help Connect-Ucs

Import-Module Cisco.UCSManager

Connect-Ucs -Name 198.18.133.91

$DefaultUcs

Get-UcsPsSession

Disconnect-Ucs