<h1>Registre sus Materias</h1>
<?php

include "conexion.inc.php";
$idsem = $_SESSION['semestre'];

echo $idsem;
$sqlf ="select * from materia where semestre=".$idsem;
$resultadof = mysqli_query($conn, $sqlf);
?>	
<form action="matins.php">
<select name='materia'>
<?php
while ($filaf = mysqli_fetch_row($resultadof))
{
	echo "<option value=".$filaf[0].">".$filaf[0]." ".$filaf[1]. "</option>";
}

?>	
	
</select>	

		
		<input type="hidden" name="cf" value="F1">
		<input type="hidden" name="cp" value="P3">
		<input type="submit" name="Seleccionar" value = "Seleccionar"> 	
		



</form>

<?php

?>