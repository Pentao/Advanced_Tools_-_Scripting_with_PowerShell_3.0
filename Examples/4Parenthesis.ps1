# parenthesis help! 

#Create a txt and csv file 
'DC', 'client' | out-file c:\temp\computers.txt 
"ComputerName, IPAddress" | Out-file c:\temp\computers.csv
"DC, 192.168.3.10" | out-file c:\temp\computers.csv -Append
"client, 192.168.3.100" | Out-File c:\temp\computers.csv -Append
Import-Csv C:\temp\computers.csv
#Getting names from a txt file
Get-service -computerName (Get-content c:\temp\computers.txt)
#Getting Names from a CSV (this was te way to do this in PoSh v2)
Get-service -computerName (Import-csv C:\temp\computers.csv |
    Select-Object -ExpandProperty computerName)

#Getting Names from a CSV, PoSH v3 dotted sintax
Get-service -computerName (Import-csv c:\temp\computers.csv).computerName


#Using Get-Adcomputer 
Invoke-command -computerName ( 
    Get-Adcomputer -filter "name -like '*c*'" |
    Select-Object -Expandproperty Name) -ScriptBlock {Get-Service -name bits} 