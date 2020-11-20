# Foreach - used often in our scripting for today 
$services = Get-Service -name b*
ForEach ($Service in $Services) { 
$Service.Displayname
}

#For loop 
For ($i=0;$i -lt 5;$i++) {
    #do something 
}

#Another way
1..5 | ForEach-Object -Process {
    Start-Process calc
}