# ex_01.ps1
# Connect
Connect-Ucs -Name 198.18.133.91
Get-UcsPSSession
Get-help Connect-Ucs

# Query UCS Manager
Get-UcsBlade
Get-UcsBlade | Select-Object Dn,Serial,Model
Get-UcsBlade -Xml

# Get Cmdlets are Class Based but can retrieve a Single Object 
Get-UcsBlade -Dn sys/chassis-3/blade-1 -Xml | Select-Object Dn, Serial, Model
