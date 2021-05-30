<?php
include "cabecera.php";


?>

<?php
include "conexion.inc.php";
session_start();
if(isset($_GET["ci"])){
	$ci = $_GET["ci"];
	$nombre = $_GET["nombre"];
	$apellido = $_GET["apellido"];
	
	
	echo "Usuario: ";
	echo $_SESSION["nombre"]."  ";
	echo $_SESSION["apellido"]."<br>";

	$sqlf ="select count(ci) from estudiante ";
	$sqlf.="where ci=".$ci;
	$resp = mysqli_query($conn, $sqlf);
	$fila=mysqli_fetch_row($resp);
	
	if($fila[0]==0){	
		$sql ="insert into estudiante values (".$ci.",'".$nombre."','".$apellido."')";
		
		$resp = mysqli_query($conn, $sql);
	}
	else{
		echo "el estudiante ya existe";
	}
	
	

	

	$sqla ="select * from seguimiento ";
	$sqla.="where estudiante='".$nombre."' ";
	$sqla.="and fechafin is NULL";
	$res = mysqli_query($conn, $sqla);
	$op =  mysqli_fetch_row($res);
	print_r($res);
	$_SESSION["ci"]=$ci;
	$_SESSION["nombre"]=$nombre;
	$_SESSION["apellido"]=$apellido;
	$_SESSION['rol']="E";
	
	if($op!= null){
		if(sizeof($op)> 0){
		header("Location: bandeja.php");
		}
	}
	
	

}


$cf = $_GET["cf"];
$cp = $_GET["cp"];

$sqll ="select * from proceso ";
$sqll.="where codFlujo='$cf' ";
$sqll.="and codProceso='$cp' ";

$resultadoo = mysqli_query($conn, $sqll);

$fila2=mysqli_fetch_row($resultadoo);
echo "Proceso: ".$fila2[5];

?>

<?php
include $fila2[5];



?>

<form action = "controlador.php" method="GET">
<input type="hidden" name="pantalla" value="<?php echo $fila2[5];?>"/>
<input type="hidden" name="codflujo" value="<?php echo $fila2[0];?>"/>
<input type="hidden" name="codproceso" value="<?php echo $fila2[1];?>"/>
<input type="submit" name="Siguiente" value="Siguiente"/>
<input type="submit" name="Anterior" value="Anterior"/>
</form>


<form action = "guardar.php" method="GET">

<input type="hidden" name="codflujo" value="<?php echo $fila2[0];?>"/>
<input type="hidden" name="codproceso" value="<?php echo $fila2[1];?>"/>
<input type="submit" name="guardar" value="Guardar"/></form>

<?php
include "pie.php";
?>