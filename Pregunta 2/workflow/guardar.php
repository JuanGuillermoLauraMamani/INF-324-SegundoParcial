<?php
include "cabecera.php";
session_start();
include "conexion.inc.php";
if($_GET["guardar"]){
$sql = "select * from seguimiento where estudiante='".$_SESSION["nombre"]."' and codflujo='".$_GET['codflujo']."' and codproceso='".$_GET['codproceso']."'";

echo $sql; 
$res=mysqli_query($conn, $sql);


$fila=mysqli_fetch_row($res);
$tramite=$fila[0]+1;
echo $tramite;
$_SESSION['tramite']=$tramite;
if($_GET['codproceso']=='P6'){
    $mifecha = date('Y-m-d H:i:s');
    $sqls="insert into seguimiento values(".$_SESSION['tramite'].",'".$_GET['codflujo']."','".$_GET['codproceso']."','".$_SESSION["usuario"]."','2021/04/19','".$mifecha."')";
    mysqli_query($conn, $sqls);
}else{
    $sqls="insert into seguimiento values(".$_SESSION['tramite'].",'".$_GET['codflujo']."','".$_GET['codproceso']."','".$_SESSION["usuario"]."','2021/04/19',null)";
    mysqli_query($conn, $sqls);
}

header("Location: motor.php?cf=".$_GET['codflujo']."&cp=".$_GET[codproceso]);

}


include "pie.php";
?>