<# This is for Azure Automation Script. You can copy and paste into runbook. it will not work on powershell.  
if you want in powershell then "Get the connection section (line 17-26) change to following line
  Install-Module -Name Az
  Import-Module -Name Az
  Connect-AzAccount"  
#>

Param 
(    
    [Parameter(Mandatory=$true,HelpMessage="Enter the value for Action. Values can be either stop or start")][String]$Action,
    [Parameter(Mandatory=$true,HelpMessage="Enter the ResourceGroup Name")][string]$ResourceGroupName
) 

    
# Get the connection "AzureRunAsConnection "

$connectionName = "AzureRunAsConnection"
$servicePrincipalConnection=Get-AutomationConnection -Name $connectionName         

Add-AzAccount `
        -ServicePrincipal `
        -TenantId $servicePrincipalConnection.TenantId `
        -ApplicationId $servicePrincipalConnection.ApplicationId `
        -CertificateThumbprint $servicePrincipalConnection.CertificateThumbprint 
    
Write-Output "Successfully logged into Azure subscription using Az cmdlets..."

# Start Vms Function

function Start-AzHPVms 
{
[CmdletBinding()]
Param
(
    [Parameter(Mandatory=$true)]$ResourceGroupName,
    [string]$ResourceType = "Microsoft.Compute/VirtualMachines"
)
Write-Output ""
Write-Output "Virtual Machine is starting" 
Get-AzResource -ResourceGroupName $ResourceGroupName -ResourceType $ResourceType | Start-AzVM -Confirm:$false -ErrorAction SilentlyContinue
}

# Stop Vms Function

function Stop-AzHPVms
{
[CmdletBinding()]
Param
(
    [Parameter(Mandatory=$true)]$ResourceGroupName,
    [string]$ResourceType = "Microsoft.Compute/VirtualMachines"
)
Write-Output ""
Write-Output "Virtual Machines are shutting down" 
Get-AzResource -ResourceGroupName $ResourceGroupName -ResourceType $ResourceType | Stop-AzVM -Confirm:$false -Force -ErrorAction SilentlyContinue
} 

$action = $action.Trim().ToLower()
$resourcegroupname = $resourcegroupname.Trim().ToLower()
$checkrgn = (Get-AzResource).ResourceGroupName

# Checking ResourceGroup Name nad Action. If both condition true. then start or stop vms on that resourcegroup name based on action (start or stop)

if(($checkrgn -eq $resourcegroupname) -and ($action -eq "start"))
{
Start-AzHPVms -ResourceGroupName $ResourceGroupName
}
elseif(($checkrgn -eq $resourcegroupname) -and ($action -eq "stop"))
{
Stop-AzHPVms -ResourceGroupName $ResourceGroupName
}
else
{ 
Write-Output "Pleae enter correct input. (either action or resourcegroupname is wrong entered)" 
}