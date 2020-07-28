Get-AzVM
Get-AzVM | fl
Get-AzVM -Name WVDFS | Format-List
Get-AzVM | Where { $_.Tags['For'] -eq "TEST"}

$vmlist = Get-AzVM | Where-Object { $_.Tags['Vmsize'] -eq "GPU" }
$vmlist | Start-AzVM

$vmlist | Stop-AzVM









