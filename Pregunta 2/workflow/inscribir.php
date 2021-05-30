
<?php 

include "conexion.inc.php";

$idmat = $_SESSION['materia'];
echo $idmat;


$sqlf = "select * from materia where id=".$idmat;
echo $sqlf;

$resultadof = mysqli_query($conn, $sqlf);

$filaf = mysqli_fetch_row($resultadof);
$mat = $filaf[1];
$sigl = $filaf[2];	

echo "<h1> Se esta inscribiendo a : <h1>";
echo "<h2>".$mat."  ".$sigl."</h2><br>";


?>
