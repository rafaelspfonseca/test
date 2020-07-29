<?PHP
date_default_timezone_set('America/Sao_Paulo');

// Host onde est&#225; hospedado o banco de dados
$db_host = "localhost";

// Nome do usu&#225;rio de acesso ao banco de dados
$db_user = "root"; //root

// Senha de acesso ao banco de dados
$db_pass = "";

// Nome da base de dados
$db_db = "test";

$conexao = mysqli_connect("$db_host","$db_user","$db_pass")
or die("Nao pude conectar " .mysqli_connect_errno());
mysqli_select_db($conexao, $db_db);
mysqli_set_charset($conexao, 'latin1');
  
?>
