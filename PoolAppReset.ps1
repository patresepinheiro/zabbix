﻿# Desenvolvido por: Patrese Pinheiro
# Programa: PoolAppReset - IIS 6
# Versão: 1.0.0 
# Criação: 1.0.0 19/02/2018 (Script Básico)

param([string]$appPoolName, [switch]$stop)

# Variável $appPool recebe a consulta WMI que localiza através o Pool especificado em {$_.Name -eq ""}

$appPoolEnv = get-wmiobject -namespace "root\MicrosoftIISv2" -class "IIsApplicationPool" | where-object {$_.Name -eq "W3SVC/AppPools/$appPoolName"}

# Realiza tratativas para STOP/START do Pool localizado anteriormente.

if($appPoolEnv)
{
   if($stop)
   {
      $appPoolEnv.Stop()
   }
   else
   {
      $appPoolEnv.Start()
   }
}

