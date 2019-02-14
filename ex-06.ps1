<# ex-06.ps1

Purpose:
    UCS Manager Service Profile and Policy Configuration and Removal
Author:
    John McDonough (jomcdono@cisco.com) github: (@movinalot)
    Cisco Systems, Inc.
#>

Import-Module Cisco.UCSManager

$creds = new-object -typename System.Management.Automation.PSCredential `
    -argumentlist "admin",$(convertto-securestring -Force -AsPlainText "Nbv12345")

$ucsm_ip = "198.18.133.91"

Connect-Ucs -Name $ucsm_ip -Credential $creds

# Add a VLAN -ModifyPresent updates existing objects
Get-UcsLanCloud | Add-UcsVlan -Name CiscoLive -Id 500 -ModifyPresent

# Add (Create) an Organization
$ucsOrg = Add-UcsOrg -Name CiscoLiveOrg -ModifyPresent

# Add (Create) a Service Profile
Add-UcsServiceProfile -Org $ucsOrg -Name CiscoLiveSP -ModifyPresent

# Add (Create) a Service Profile. Continue on Next line with backtick
Add-UcsBootPolicy -Org $ucsOrg -Name CL_BP_01 -RebootOnUpdate yes -BootMode legacy -ModifyPresent | `
    Add-UcsLsbootVirtualMedia -ModifyPresent -Access "read-only-local" -LunId "0" -Order 1

# Same Add as above but line continuation is managed by $()
$(Add-UcsBootPolicy -Org $ucsOrg -Name CL_BP_02 -RebootOnUpdate yes -BootMode legacy -ModifyPresent |
    Add-UcsLsbootVirtualMedia -ModifyPresent -Access "read-only-local" -LunId "0" -Order 1)

# Add the boot policy to the Service Profile
Get-UcsServiceProfile -Name CiscoLiveSP | Set-UcsServiceProfile -BootPolicyName CL_BP_01 -Force

# Add the boot policy to the Service Profile a different way
Add-UcsServiceProfile -Org $ucsOrg -Name CiscoLiveSP -BootPolicyName CL_BP_02 -ModifyPresent

# Retrieve the Service Profile 
Get-UcsServiceProfile -Name CiscoLiveSP

# Different Filter options case sensitive and case insensitive
Get-UcsOrg -Name CiscoLiveOrg | Get-UcsBootPolicy -Filter 'Name -clike cL_BP_0?' | Remove-UcsBootPolicy -Force
Get-UcsOrg -Name CiscoLiveOrg | Get-UcsBootPolicy -Filter 'Name -ilike cL_BP_0?' | Remove-UcsBootPolicy -Force

Get-UcsServiceProfile -Name CiscoLiveSP

# Remove the Org, removes everything under the Org
Remove-UcsOrg -Org $ucsOrg -Force

# Remove the VLAN
Get-UcsVlan -Name CiscoLive | Remove-UcsVlan -Force

Disconnect-Ucs