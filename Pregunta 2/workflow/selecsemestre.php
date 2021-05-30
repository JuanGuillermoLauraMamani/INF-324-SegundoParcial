<h1>Registre su semestre </h1>

<?php
;
include "conexion.inc.php";

$sqlf ="select * from semestre ";
$resultadof = mysqli_query($conn, $sqlf);
?>	
<form action="semins.php">
<select name="semestre">

<?php
while ($filaf = mysqli_fetch_row($resultadof))
{
	echo "<option value=".$filaf[0].">".$filaf[1]. "</option>";
}

?>	
	
</select>	

		<input type="hidden" name="cf" value="F1">
		<input type="hidden" name="cp" value="P2">
		<input type="submit" name="Seleccionar" value = "Seleccionar"> 	
	
</form>
