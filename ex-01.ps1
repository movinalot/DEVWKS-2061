<# ex-01.ps1

Purpose:
    UCS Manager connect and query example
Author:
    John McDonough (jomcdono@cisco.com) github: (@movinalot)
    Cisco Systems, Inc.
#>

Import-Module Cisco.UCSManager

Connect-Ucs -Name 10.10.20.40

# Query UCS Manager
Get-UcsBlade
Get-UcsBlade | Select-Object Dn,Serial,Model
Get-UcsBlade -Xml

# Get Cmdlets are Class Based but can retrieve a Single Object 
Get-UcsBlade -Dn sys/chassis-3/blade-1 -Xml | Select-Object Dn, Serial, Model

Disconnect-Ucs
