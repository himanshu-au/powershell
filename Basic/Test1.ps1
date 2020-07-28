param(
#parameter1
[parameter (mandatory = $true)]
[validateNotNull()]
[validateNotNullorEmpty()]
[string]
$location = '',

#parameter2
[parameter (mandatory = $true)]
[validateNotNull()]
[validateNotNullorEmpty()]
[int32]
$oldday = ''
)

$time = (Get-Date).AddDays($oldday)

$Name = Get-ChildItem -Path $location -File -Recurse | ? {$_.LastWriteTime -lt $time}

Write-Output "File(s) identified:" $name.FullName


