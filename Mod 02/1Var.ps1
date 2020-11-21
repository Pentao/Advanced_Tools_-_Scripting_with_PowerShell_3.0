#Variab1es to store your stuff 
#Assigning a variable 
$MyVar=2
${My Var}="Hello"
#Output a variable 
$MyVar 
${My Var} 
Write-output $MyVar

#strongly type a variable 
[String]$MyName= "Jason" 
[int] $Oops= "Jason"

$X=[int]"1"
[int]$X="1"

[string]$ComputerName=Read-host "Enter Computer Name"
write-output $computerName

$d="12/25/2013"
[datetime]$d="12/25/2013"
$d.AddDays(-(6*7))

[ValidateSet("a","b","c")][string]$x="a"
[ValidateSet("a","b","c")][string]$x="test"