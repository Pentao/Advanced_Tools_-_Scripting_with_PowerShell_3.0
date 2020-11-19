#Quotation Marks 
#Doub1e quotes resolve the variable 
$i="PowerShell"

"This is the variable $i, and $i Rocks!"
'This is the variable $i, and $i Rocks!'
"This is the variable `$i, and $i Rocks!" 

$computerName="Client"
$computerName=(hostname)
Get-service -name bits -computerName "$ComputerName" | Select-Object MachineName, Name, Status