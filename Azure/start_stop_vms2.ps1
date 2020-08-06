# This is script will start or stop all VMs inside ResourceGroupName enter.

# Get the connection "AzureRunAsConnection "

$connectionName = "AzureRunAsConnection"
$servicePrincipalConnection=Get-AutomationConnection -Name $connectionName         

Add-AzAccount `
        -ServicePrincipal `
        -TenantId $servicePrincipalConnection.TenantId `
        -ApplicationId $servicePrincipalConnection.ApplicationId `
        -CertificateThumbprint $servicePrincipalConnection.CertificateThumbprint 
    
Write-Output "Successfully logged into Azure subscription using Az cmdlets..."

# Define two parameters.  1) Action (Start or Stop) 2) Resource Group Name
Param 
(    
    [Parameter(Mandatory=$true,HelpMessage="Enter the value for Action. Values can be either stop or start")][String]$Action,
    [Parameter(Mandatory=$true,HelpMessage="Enter the ResourceGroup Name")][string]$ResourceGroupName
) 


$jobs = @()
$vms = Get-AzVM | Where-Object {$_.ResourceGroupName -eq $Resourcegroupname}
$Action = $Action.Trim().tolower()
$ResourceGroupName = $ResourceGroupName.Trim().ToLower()


if($Action -eq "start")
    {
    foreach ($vm in $vms)
        {
        $params = @($vm.name,$vm.ResourceGroupName)
        $job = Start-Job -scriptblock { 
            param($computername,$rgn) 
            Start-AzVM -ResourceGroupName $rgn -name $computername 
        } -argumentlist $params
        $jobs = $jobs + $job
        }
    If($jobs -ne @())
        {
        Write-Output "Waiting for Start jobs to complete..." 
        Wait-Job -job $jobs
        Get-Job | receive-job
        }
    Else
        {
        Write-Output "There were no running VMs" 
        Get-AzVM
        }
    }
elseif($Action -eq "stop")
    {
    foreach ($vm in $vms)
        {
        $params = @($vm.name,$vm.ResourceGroupName)
        $job = Start-Job -scriptblock {
             param($computername,$rgn) Stop-AzVM -ResourceGroupName $rgn -name $computername -Force 
            } -argumentlist $params
        $jobs = $jobs + $job
        }
    If($jobs -ne @())
        {
        Write-Output "Waiting for stop jobs to complete..." 
        Wait-Job -job $jobs
        Get-Job | receive-job
        }
    Else
        {
        Write-Output "There were no running VMs" 
        Get-AzVM
        }
    }