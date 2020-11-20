#switch can be easier to maintain than If statement 
#and can provide additional features

$Status = 3
Switch ($Status) { 
0 { $Status_text = 'ok' } 
1 { $Status_text = 'error' } 
2 { $Status_text = ' jammed' } 
3 { $Status_text = 'overheated' } 
4 { $Status_text = 'empty' } 
default { $Status_text= 'unknown'}
}
$Status_text

#Jeffrey hates stuff like that ↑
$Status = 3
$status_text = Switch ($Status) { 
0 { 'ok' } 
1 { 'error' } 
2 { ' jammed' } 
3 { 'overheated' } 
4 { 'empty' } 
default { 'unknown'}
}
$Status_text
