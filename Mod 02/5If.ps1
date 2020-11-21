If ($this -eq $that) { 
    # commands 
    } elseif ($those -ne $them) { 
    # commands 
    } elseif ($we -gt $they) { 
    # commands 
    } else { 
    # sommands
    }

$Status=(Get-service -name bits).status 
If ($Status -eq "Running") { 
    Clear-Host 
    write-Output "Service is being stopped" 
    stop-service -name bits
} Else { 
    Clear-Host 
    write-Output "service is already stopped"
} 

#Example from jeffrey
$y = if ($false) {"1"} else {"2"}
$y