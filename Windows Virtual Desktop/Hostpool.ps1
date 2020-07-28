$resourcegroupname = 'WVD'
$hostpoolname = 'GPU_TEST'
$workspacename =  'GPU_WS'
$hostpooltype = 'Pooled'
$loadbalancertype = 'BreadthFirst'
$location = 'eastus'
$desktopappgroupname = 'GPU_DAG'
$signinName = 'abc@xyz.com'




New-AzWvdHostPool -ResourceGroupName $resourcegroupname -Name $hostpoolname -WorkspaceName $workspacename -HostPoolType $hostpooltype -LoadBalancerType $loadbalancertype -Location $location -DesktopAppGroupName $desktopappgroupname


New-AzWvdRegistrationInfo -ResourceGroupName $resourcegroupname -HostPoolName $hostpoolname -ExpirationTime $((get-date).ToUniversalTime().AddHours(2).ToString('yyyy-MM-ddTHH:mm:ss.fffffffZ'))



New-AzRoleAssignment -SignInName $signinName -RoleDefinitionName "Desktop Virtualization User" -ResourceName $desktopappgroupname -ResourceGroupName $resourcegroupname -ResourceType 'Microsoft.DesktopVirtualization/applicationGroups'


(get-date).ToUniversalTime().AddHours(2).ToString('yyyy-MM-ddTHH:mm:ss.fffffffZ')



Get-AzWvdHostPool -ResourceGroupName $resourcegroupname `
                    -Name $hostpoolname 