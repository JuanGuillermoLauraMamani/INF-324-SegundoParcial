
<?php
session_start();

include "conexion.inc.php";
$cp = $_GET["cp"];
$cf = $_GET["cf"];
$docs = $_GET["doc"];
echo "<h3>Usted selecciono los documentos : </h3><br>";
$_SESSION["docs"] = $docs;


if(!empty($_GET['doc'])){
foreach($_GET['doc'] as $selec){
$sql="select * from documentos where id=".$selec;
//echo $sql;
$res=mysqli_query($conn, $sql);
$fila=mysqli_fetch_row($res);
echo $fila[1]."<br>";
$sqli="insert into registrodoc values(".$_SESSION['ci'].",".$selec.")";
mysqli_query($conn,$sqli);
}
}
header("Location: motor.php?cf=$cf&cp=$cp");
?>

