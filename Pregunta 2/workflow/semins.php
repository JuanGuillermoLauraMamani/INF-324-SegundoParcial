<?php
include "conexion.inc.php";
session_start();
$cp = $_GET["cp"];
$cf = $_GET["cf"];
$semestre = $_GET["semestre"];

$sql="select * from semestre where id=".$semestre;
$ress=mysqli_query($conn,$sql);
$fila=mysqli_fetch_row($ress);
echo "<h4>Usted selecciono el semestre : ".$fila[1]."<h4>";

$_SESSION["semestre"] = $semestre;
header("Location: motor.php?cf=$cf&cp=$cp");
?>
