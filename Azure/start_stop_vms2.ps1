workflow start-stop-vms {
    param (
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


    $vms = Get-AzVM | Where-Object {$_.ResourceGroupName -eq $Resourcegroupname}
    $Action = $Action.Trim().tolower()
    $ResourceGroupName = $ResourceGroupName.Trim().ToLower()

if($Action -eq "start")
    {
        foreach -parallel ($vm in $vms) {
            Start-AzVM -ResourceGroupName $vm.ResourceGroupName -Name $vm.Name
        }
    
    }
elseif($Action -eq "stop")
    {
    foreach -parallel ($vm in $vms) {
        Stop-AzVM -ResourceGroupName $vm.ResourceGroupName -Name $vm.Name -Force
        }
    }
}


