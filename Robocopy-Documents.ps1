# Script de sauvegarde de la directory Documents vers HDD EXT
$DirLog = "C:\Tools\log\"
$Date = Get-Date -Format ddMMyyyy
$FicLog = "$Date-Copylog.txt"
$DirSource = "D:\Documents\"
$DirDest = "F:\Documents\"
# $DirSource = "D:\"
# $DirDest = "F:\SAVE-D\"

ADD-content -path $DirLog\$FicLog -value (Get-Date)
ADD-content -path $DirLog\$FicLog -value "Debut de sauvegarde" 

if(Test-Path $DirDest){
   ADD-content -path $DirLog\$FicLog -value "Disque Externe Disponible" ; 
   robocopy $DirSource $DirDest  /MIR /NFL /NDL /Z /R:3 /W:5 /UNILOG+:$DirLog$FicLog ;
   ADD-content -path $DirLog\$FicLog -value (Get-Date) ;
   ADD-content -path $DirLog\$FicLog -value "Fin de sauvegarde"
}
else{
   ADD-content -path $DirLog\$FicLog -value "Disque F non Disponible !!"
}



