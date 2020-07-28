



$gr = Get-AzureADGroup | ? Displayname -Match WVDUsers
$t = "Microsoft.DesktopVirtualization/applicationgroups"
$resourname = "55host-DAG"
get-AzRoleAssignment -ResourceGroupName WVD -RoleDefinitionName "Desktop Virtualization User" -ObjectId $gr.ObjectId -ResourceName $resourname -ResourceType $t

Get-AzWvdApplicationGroup -ResourceGroupName wvd