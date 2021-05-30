<?php
session_start();
include "conexion.inc.php";
$sql="select * from proceso where codproceso='P1' and rol='".$_SESSION["rol"]."'";
$resultado=mysqli_query($conn, $sql);
?>
<form action="" method="GET">
	<select name="flujo_selecionado">
	<?php
	while ($fila=mysqli_fetch_array($resultado))
		echo "<option value=".$fila['codFlujo'].">".$fila['codFlujo']."</option>";
	?>
	</select>
	<input type="submit" name="Enviar" value="Enviar"/>
<form>