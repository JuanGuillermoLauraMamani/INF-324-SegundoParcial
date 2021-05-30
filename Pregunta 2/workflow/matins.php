<?php
session_start();
include "conexion.inc.php";

$cp = $_GET["cp"];
$cf = $_GET["cf"];
$materia = $_GET["materia"];
if (PHP_VERSION >= 5.1) {
    session_regenerate_id(true);
    $_SESSION['materia'] = $materia;
} 
    else {
        session_regenerate_id();
        $_SESSION['materia'] = $materia;
    }

$sql="select * from materia where id=".$materia;
echo $sql;
$ress=mysqli_query($conn,$sql);
$fila=mysqli_fetch_row($ress);
echo "<h4>Usted selecciono la materia : ".$fila[1]."<h4>";


header("Location: motor.php?cf=$cf&cp=$cp&materia=$materia");
?>
