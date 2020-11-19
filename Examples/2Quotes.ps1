#Quotation Marks 
#Doub1e quotes resolve the variable 
$i="PowerShell"

"This is the variable $i, and $i Rocks!"
'This is the variable $i, and $i Rocks!'
"This is the variable `$i, and $i Rocks!" 

$computerName="Client"
$computerName=(hostname)

<#Double quotes aren't required for variables.
Design decision from the days of the "trustworthy computer memo", the PowerShell parser has been designed to address SQL injection type attacks.
#>
Get-service -name bits -computerName "$ComputerName" | 
Select-Object MachineName, Name, Status

$p = get-process lsass
#I want to get the process ID and show the value
"Process id = $p.id"
<# When you evaluate the above in quotes, the parser evolves the variable into a string and then concatenates it to "".id"
Making it the equivalent of running this: $p.ToString()
The result is: 'Process id = System.Diagnostics.Process (lsass).id'
So the right way to do it is: "process id = $($p.id)" so when you out the expression in parentecies the parser executes it first
#>
"process id = $($p.id)"
#when we see tje "$(". we execute whateve is in the paretesis first. 
"process id = $(read-host -promt "what should I give them?")"

#If we use singel quotes there is no expressione evalutation
'process id = $(read-host -promt "what should I give them?")'

<# 
Here strings, are a multyline string
You use single quotes so you don't expand it. 
Double quotes will expand/evaluate variables wrapped in the Here String. 
#>
@'
$i="PowerShell"
"This is the variable $i, and $i Rocks!"
'This is the variable $i, and $i Rocks!'
"This is the variable `$i, and $i Rocks!" 
'@

@"
$i="PowerShell"
"This is the variable $i, and $i Rocks!"
'This is the variable $i, and $i Rocks!'
"This is the variable `$i, and $i Rocks!" 
"@

#Use example, assign the Here string into a varialble
$Script = @'
$i="PowerShell"
"This is the variable $i, and $i Rocks!"
'This is the variable $i, and $i Rocks!'
"This is the variable `$i, and $i Rocks!" 
'@

#We create a new snippet, this only works in the ISE, 
#for VS code read this: https://jdhitsolutions.com/blog/scripting/5488/adding-powershell-snippets-to-visual-studio-code/
Import-Module ISE
New-IseSnippet -Description "Thu=is is a test which shows stuff" -Text $script -Title _MYVARTEST -Author Jeffrey