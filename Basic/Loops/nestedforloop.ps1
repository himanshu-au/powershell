$aa = @("Rahi","Ved")
$bb = @("Playing","Watching","Drawing")
$color = @("Cyan","Magenta","Green")

foreach ($item in $aa){
    for ($i = 0; $i -lt 3; $i++)
    { 
        $a = $bb[$i]
        $c = $color[$i]
        write-host $item likes $a -ForegroundColor $c
        Start-Sleep -Seconds 1
    }
    }

write-host ""
write-host "---------------------------" -ForegroundColor Yellow
write-host ""
start-sleep -Seconds 5

for ($i = 0; $i -lt 3; $i++)
{
    foreach ($item in $aa)
    { 
        $a = $bb[$i]
        $c = $color[$i]
        write-host $item likes $a -ForegroundColor $c
        Start-Sleep -Seconds 1
    }
    }



$cs = "*"
$ce = 1

for ($i = 1; $i -lt 51; $i++)
{ 
    $ce = $i
    $asdf = $cs * $ce
    write-host $asdf
}

for ($i = 49; $i -gt 0; $i--)
{ 
    $ce = $i
    $asdf = $cs * $ce
    write-host $asdf
}




for( $i = 1; $i -le 5; $i++)
{
for( $j = 5; $j -ge $i; $j--)
  {
  write-host -NoNewline " "
 } 
 for($k = 1; $k -le $i; $k++)
 {
 write-host -NoNewline "* "
 }
 write-host
 }

