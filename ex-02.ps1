<# ex-02.ps1

Purpose:
    UCS Manager query with Filters example
Author:
    John McDonough (jomcdono@cisco.com) github: (@movinalot)
    Cisco Systems, Inc.
#>

Import-Module Cisco.UCSManager

$creds = new-object -typename System.Management.Automation.PSCredential `
    -argumentlist "admin",$(convertto-securestring -Force -AsPlainText "Nbv12345")

$ucsm_ip = "10.10.20.40"

Connect-Ucs -Name $ucsm_ip -Credential $creds

# PowerTool is case sensitive by default
Get-UcsBlade -Model UCSB-B200-M4 | Select-Object Dn, Serial, Model | Format-Table
Get-UcsBlade -Model ucsb-B200-M4 | Select-Object Dn, Serial, Model | Format-Table

# PowerShell is case insensitive by default
Get-UcsBlade | Where-Object {$_.Model -eq 'ucsb-B200-M4'} | Select-Object Dn, Serial, Model

# Filter Strings
Get-UcsBlade -Filter 'Model -ilike UcsB-b200-M3' -Xml | Select-Object Dn, Model
Get-UcsBlade -Filter 'Model -ilike UcsB-b200-M4' -Xml | Select-Object Dn, Model

Disconnect-Ucs