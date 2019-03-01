# Desenvolvido por: Patrese Renan
# Leia-me:
# Versão: 1.0.0
# Criação: 1.0.0 01/03/2018
# Objetivo: Realizar a validação de autenticação de um usuário em WebService

# Credenciais de Acesso {usuário:senha}
$userpass = "usuario:senha"

# Encodar a senha
$sEncodedString=[Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($userpass))

# Variável que recebe o valor de usuario:senha encriptados;
$Headers = @{ Authorization = "Basic $($sEncodedString)"}

# Variável $status armazenará resultado da requisição Web ao Metódo User;
try
{
	$Status = Invoke-WebRequest -Uri 'http://host:porta/metodo' -Headers $Headers -ErrorAction SilentlyContinue | Select StatusCode -ExpandProperty StatusCode 
} 
catch
{
	$Status = "404"  
}

#Valida o retorno e imprimir resultado booleano.
if($Status -eq "200")
{
   echo 1
}  
else 
{
   echo 0
}
