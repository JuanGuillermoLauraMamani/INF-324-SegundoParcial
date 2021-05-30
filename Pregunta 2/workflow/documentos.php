<h1>Registre sus documentos personales </h1>

<?php

include "conexion.inc.php";
$sqlf ="select * from documentos";
$resultadof = mysqli_query($conn, $sqlf);
?>	
<form action="regdoc.php">

<div>
<?php
while ($filaf = mysqli_fetch_row($resultadof))
{
    echo "<input type='checkbox' name='doc[]' value=".$filaf[0].">".$filaf[1]."<br/>";
}

?>	

</div>
		<div>
		<input type="hidden" name="cf" value="F1">
		<input type="hidden" name="cp" value="P1">
		<input type="submit" name="SeleccionarDoc" value = "Seleccionar"> 	
		</div>
</form>

<?php


?>