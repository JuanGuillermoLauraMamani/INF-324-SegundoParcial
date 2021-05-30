<?php
$flujo=$_GET["flujo_selecionado"];

session_start();
include "conexion.inc.php";



$sql="select * from iniciales where tipo='nrotramite'";
$resultado=mysqli_query($conn, $sql);
$fila=mysqli_fetch_array($resultado);
$tramite=$fila["valor"];


$sql ="select * from seguimiento where fechafin is null and nrotramite=".$tramite;

$res = mysqli_query($conn, $sql);
$fila = mysqli_fetch_row($res);
$proceso=$fila[2];
$_SESSION['tramite']=$tramite;
$_SESSION['flujo']=$flujo;
$_SESSION['proceso']=$proceso;

echo $proceso;
$tramite = $tramite+1;
$sql="update iniciales set valor=$tramite where tipo='nrotramite'";
mysqli_query($conn, $sql);
$sql="insert into seguimiento values($tramite,'".$flujo."','".$proceso."','".$_SESSION["usuario"]."','2021/04/19',null)";
$resultado=mysqli_query($conn, $sql);
header("Location: motor.php?cf=$flujo&cp=$proceso");
?>