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
    write-host "you have  type $action, please type start or stop" -ForegroundColor Cyan}