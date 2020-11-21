# Do loop
$i= 1
Do {
    write-output "powershell is Great! $i"
    $i=$i+1 # $i++
} while ( $i -le 5) #Also DO-Until 

# While Loop 
$i=5 
While ($i -ge 1) {
    Write-output "scripting is great! $i"
    $i--
}
