
<?php 

include "conexion.inc.php";
$ci =$_SESSION["ci"];
$idmat = $_SESSION["materia"];
$sqlf = "select count(ci) from inscrito where ci=".$ci." and id=".$idmat."";

$res = mysqli_query($conn, $sqlf);
$a =  mysqli_fetch_row($res);
if($a[0] > 0){
	echo "<p style='color:red; font-size: 18px'>Ya esta inscrito en la materia</p>";
}
else{
	$sqlf = "insert into inscrito values(".$ci.",".$idmat.")";
	echo $sqlf;
	$r = mysqli_query($conn, $sqlf);
	print_r($r);
	if($r){
	 	echo "Ya se inscribio correctamente";
	}else{
		echo "ERROR";
	}
	
}
?>
