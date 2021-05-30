<h1>Materia que estoy inscrito</h1>
<table >
	
</table>
<?php 
include "conexion.inc.php";

$ci = $_SESSION["ci"];


$sqlf = "Select nombre, sigla From materia m, inscrito i ";
$sqlf.= "Where ci = ".$ci." ";
$sqlf.= "and m.id = i.id";
$resultadof = mysqli_query($conn, $sqlf);
echo "<h3>Materias Inscritas</h3>";
echo "<table border="."1px".">";
echo "<tr>";
echo "<td>Materia</td>";
echo "<td>Sigla</td>";
echo "</tr>";
while ($filaf = mysqli_fetch_row($resultadof))
{

	echo "<tr>";
	echo "<td>".$filaf[0]."</td>";
	echo "<td>".$filaf[1]."</td>";
	echo "<tr>";
}
echo "</table>";


?>
<h3>Documentos Presentados</h3>
<?php 
$sqld="select d.nomdoc from documentos d, registrodoc r where d.id=r.iddoc and  r.ciest=".$_SESSION['ci'];
$resd=mysqli_query($conn,$sqld);
echo "<table border="."1px".">";
echo "<tr>";
echo "<td>Documentos</td>";
echo "</tr>";
while ($filaf = mysqli_fetch_row($resd))
{

	echo "<tr>";
	echo "<td>".$filaf[0]."</td>";
	echo "<tr>";
}
echo "</table>";

?>
