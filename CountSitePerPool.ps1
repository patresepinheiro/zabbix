# Desenvolvido por: Patrese Pinheiro
# Programa: CountSitePerPool - IIS 6
# Versão: 1.0.0 
# Criação: 1.0.0 19/02/2018 (Script Básico)

#Variável - Nome do Processo
$processname = "w3wp.exe"

#Consulta WMI
Get-WmiObject Win32_Process -Filter "name = '$processname'" | Select-Object CommandLine | Where {$_ -match "DefaultAppPool"} | 
measure-object | Select-Object Count -ExpandProperty Count
