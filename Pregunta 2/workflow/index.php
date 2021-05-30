<?php
include "cabecera.php";
?>
<h1>ALUMNOS NUEVOS</h1>
<p><h3>Registrate</h3></p>
<form action="motor.php">
<div>
<font style="color:blue; font-size: 18px">Carnet de identidad</font>
<br>
<input type="text" value="" name="ci"/><br>
<font style="color:blue; font-size: 18px">Nombre</font>
<br>
<input type="text" value="" name="nombre"/><br>
<font style="color:blue; font-size: 18px">Apellidos</font>
<br>
<input type="text" value="" name="apellido"/><br>
<br>
<input type="submit" name="Siguiente" value="Siguiente">
<input type="hidden" name="cp" value="P1">
<input type="hidden" name="cf" value="F1">
</div>

</form>
<?php
include "pie.php";
?>