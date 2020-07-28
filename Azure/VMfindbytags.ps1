Get-AzVM
Get-AzVM | fl
Get-AzVM -Name WVDFS | Format-List
Get-AzVM | Where { $_.Tags['For'] -eq "TEST"}

$vmlist = Get-AzVM | Where-Object { $_.Tags['Vmsize'] -eq "GPU" }
$vmlist | Start-AzVM

$vmlist | Stop-AzVM


$action = Read-Host "Please Enter Action start or stop:" 

if ($action.trim().ToLower() -eq "start")
 {  $action = $action.Trim().ToLower()
    write-host "you have type $action" -ForegroundColor Magenta}
elseif ($action.trim().ToLower() -eq "stop")
{
    $action = $action.Trim().ToLower()
    write-host "you have type $action" -ForegroundColor green}
else
{
    write-host "you have not type $action" -ForegroundColor Cyan}






