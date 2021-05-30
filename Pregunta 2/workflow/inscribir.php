
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

echo "<h1> Usted se inscribira a la materia <h1>";
echo "<h2>".$mat."  ".$sigl."</h2><br>";
		
echo "Si esta de acuerdo presione siguiente";

?>
