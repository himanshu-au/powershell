<# 
.Synopsis
    To get all FSMO Roles
.DESCRIPTION
    To get all Flexible Single Master Operational Roles instead of typing Get-ADForest and Get-ADDomain Cmdlet
.EXAMPLE
    Get-ADFSMORole
#>
function Get-ADFSMORole 
{
    [CmdletBinding()]
    param (      
    )
    Get-ADForest | Format-List DomainNamingMaster, SchemaMaster
    Get-ADDomain | Format-List PDCEmulator, RIDMaster, InfrastructureMaster     
}