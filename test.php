<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-gb" lang="en-gb" dir="ltr" id="minwidth" >
<head>
<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1" />
<title>Test</title>

<style>
table, td, th {
  border: 1px solid black;
}

table {
  border-collapse: collapse;
  width: 100%;
}


tr:nth-child(even) {
 background-color: #f2f2f2;
}

th {
  background-color: #4CAF50;
  color: white;
}

.xml {
  background-color: #B0B0B0;
  color: black;
  text-align: center;
}


</style>

</head>
<body  leftmargin='0' topmargin='0' rightmargin='0' bottommargin='0' bgproperties="fixed">


<form name="cadastro" method="get">

<?

function identical_values( $arrayA , $arrayB ) {

    ///sort( $arrayA );
    //sort( $arrayB );

    return ($arrayA == $arrayB);
}


include "conecta_db.php";

$cod_empresa = '1';
$periodo = '2020-02';

echo "<p>";
echo "<b>EMPRESA:</b> $cod_empresa<br>";
echo "<b>PERIODO:</b> $periodo<br>";
echo "<hr><p>";



echo "*************************************************************************************************************************<br>";
echo "<b>NOTAS SPED - RESPECTIVOS XML's e C190</b><br>";
echo "*************************************************************************************************************************<p>";


  //buscar faturamento registros no SPED (C100, C190) ------------------------------------------------------------------
  $sql1 = "SELECT tb_spedc100.cod_spedC100,  cod_mod, num_doc, data_doc,
                  tb_spedc190.cfop, SUM(vl_opr) as vl_opr, chv_nfe
           FROM tb_spedc100, tb_spedc190
           WHERE tb_spedc100.cod_spedC100 = tb_spedc190.cod_spedC100
            AND  tb_spedc190.cfop >= '5000'
            AND tb_spedc100.cod_periodo_empresa = '14'
            -- AND   num_doc = '8802'
            GROUP BY num_doc
            ORDER BY tb_spedc190.cfop
            ";

  $consulta = mysqli_query($conexao, $sql1)or die("Error1: " .mysqli_error($conexao));

  $cont_C100 = 1;
  $divergencia = 0;
  while($resultado = mysqli_fetch_array($consulta)){
   $cod_spedC100        = $resultado['cod_spedC100'];
   $cod_mod             = $resultado['cod_mod'];
   $num_doc             = $resultado['num_doc'];
   $data_doc            = $resultado['data_doc'];
   $cfop                = $resultado['cfop'];
   $vl_opr              = $resultado['vl_opr'];
   $chv_nfe             = $resultado['chv_nfe'];


   //echo "valor_doc: $valor_doc<br>";
   //echo "vl_opr: $vl_opr<br>";
   echo"<table border='1'>";
   echo"<tr>";
   echo"<th width='10%'><B>C100</B></th>";
   echo"<th width='10%'>MODELO</th>";
   echo"<th width='10%'>NUM DOC</th>";
   echo"<th width='10%'>DATA</th>";
   echo"<th width='10%'>CFOP</th>";
   echo"<th width='10%'>VL OPR</th>";
   echo"</tr>";

   $aux_valor_opr = number_format($vl_opr, '0', '', '');
   $aux_valor_opr = substr_replace($aux_valor_opr, '.', -2, 0);
   $aux_valor_opr = number_format($aux_valor_opr, '2', '.', '');



   echo"<tr>";
   echo"<td align='center'>$cont_C100</td>";
   echo"<td align='center'>$cod_mod</td>";
   echo"<td align='center'>$num_doc</td>";
   echo"<td align='center'>$data_doc</td>";
   echo"<td align='center'>$cfop</td>";
   echo"<td align='center'>$aux_valor_opr</td>";
   echo"</tr>";
   echo"</table>";

   $cont_C100++;


   //consultar XML da nota-------------------------------------------------------------------------------------------
   $sql2 = "select modelo, num_nf, data_emissao, cfop, valor_total, vNF, qtd_item, valor_item, valor_desc
            from tb_nota, tb_nota_item
            WHERE tb_nota_item.cod_nota = tb_nota.cod_nota
              AND cod_empresa = '$cod_empresa'
              and DATE_FORMAT(data_emissao, '%Y-%m') = '$periodo'
              AND num_nf = '$num_doc'
              AND modelo = '$cod_mod'
              AND chNFe  = '$chv_nfe'
              ORDER BY cfop
            ";

   $consulta2 = mysqli_query($conexao, $sql2)or die("Error2: " .mysqli_error($conexao));
   $tem_xml = mysqli_num_rows($consulta2);
   $vetor_xml = array();
   if($tem_xml>0){
    echo"<table border='1'>";
    echo"<tr class=xml>";
    echo"<td width='10%'><b>XML</b></td>";
    echo"<td width='10%'>MODELO</td>";
    echo"<td width='10%'>NUM NF</td>";
    echo"<td width='10%'>DATA</td>";
    echo"<td width='10%'>CFOP</td>";
    echo"<td width='10%'>VALOR</td>";
    echo"</tr>";

   while($resultado2 = mysqli_fetch_array($consulta2)){
    $modelo         = $resultado2['modelo'];
    $num_nf         = $resultado2['num_nf'];
    $data_emissao   = $resultado2['data_emissao'];
    $cfop           = $resultado2['cfop'];
    $valor_total    = $resultado2['valor_total'];
    $vNF            = $resultado2['vNF'];
    $qtd_item       = $resultado2['qtd_item'];
    $valor_item     = $resultado2['valor_item'];
    $valor_desc     = $resultado2['valor_desc'];

    $aux_vNF      = number_format($vNF, '2', '.', '');
    $valor_item   = number_format($valor_item, 2, '.', '');
    $valor_desc   = number_format($valor_desc, 2, '.', '');
    $vTot         = (($qtd_item * $valor_item) - $valor_desc);
    $vTotal       = number_format($vTot, 2, '.', '');

    //var_dump($vTotal);

    @$vetor_xml[$cfop] += $vTotal;

    echo"<tr>";
    echo"<td align='center'>#</td>";//$natOp
    echo"<td align='center'>$modelo</td>";
    echo"<td align='center'>$num_nf</td>";
    echo"<td align='center'>$data_emissao</td>";
    echo"<td align='center'>$cfop</td>";
    echo"<td align='center'>$vTotal</td>";
    echo"</tr>";



   //consultar XML da nota-----------------------------------------------------------------------------
   }
   echo"</table>";
   if(isset($vetor_xml))print_r($vetor_xml);
   }

   echo"<br>";


   //consultar C190-------------------------------------------------------------------------------------------

   $sql3 = "select cfop, vl_opr
            from tb_spedc100, tb_spedc190
            where tb_spedc100.cod_spedC100 = tb_spedc190.cod_spedC100
              AND tb_spedc100.cod_periodo_empresa = tb_spedc190.cod_periodo_empresa
             -- AND tb_cfop.cfop = tb_spedc190.cfop
              AND tb_spedc190.cod_periodo_empresa = '14'
              AND num_doc = '$num_doc'
              AND cod_mod = '$cod_mod'
              ORDER BY cfop
            ";

   $consulta3 = mysqli_query($conexao, $sql3)or die("Error3: " .mysqli_error($conexao));


    echo"<table border='1'>";
    echo"<tr class=xml>";
    echo"<td width='10%'><b>C190</b></td>";
    echo"<td width='10%'>-</td>";
    echo"<td width='10%'>-</td>";
    echo"<td width='10%'>-</td>";
    echo"<td width='10%'>CFOP</td>";
    echo"<td width='10%'>VALOR</td>";
    echo"</tr>";

   $vetor_c190 = array();
   while($resultado3 = mysqli_fetch_array($consulta3)){
    $cfop           = $resultado3['cfop'];
    $vl_opr         = $resultado3['vl_opr'];

    $aux_vl_opr = number_format($vl_opr, '0', '', '');
    $aux_vl_opr = substr_replace($aux_vl_opr, '.', -2, 0);
    $aux_vl_opr = number_format($aux_vl_opr, '2', '.', '');

    //var_dump($aux_vl_opr);

    @$vetor_c190[$cfop] += $aux_vl_opr;

    echo"<tr>";
    echo"<td align='center'>#</td>";//$natOp
    echo"<td align='center'>-</td>";
    echo"<td align='center'>-</td>";
    echo"<td align='center'>-</td>";
    echo"<td align='center'>$cfop</td>";
    echo"<td align='center'>$aux_vl_opr</td>";
    echo"</tr>";



   //consultar C190-----------------------------------------------------------------------------
   }
   echo"</table>";
   if(isset($vetor_c190))print_r($vetor_c190);



   echo"<br>";
   //echo "XML:".var_dump($vetor_xml)."<br>";
   //echo "C190:".var_dump($vetor_c190)."<br>";


   @$res = identical_values( $vetor_xml , $vetor_c190 );

   //@$res = var_dump($vetor_xml === $vetor_c190);
   //var_dump($res);
   if(($tem_xml>0)&&(empty($res))) {
    echo "<p><b>NOT EQUAL</b>";
    $divergencia++;
   }
   else{
    echo"<p><b>EQUAL</b>";
   }




   echo "<hr>";
   echo "<p><br>";

  }
  echo "Rows Not Equal: $divergencia";



?>

</form>
</body>
</html>
