<?php
//Se busca en la computadora del usuario si existe alguna cookie llamada ID_USUARIO si no se encuentra se redirije a loguear
$a = $_COOKIE["ID_USUARIO"];
if (!$a) {
    header("location: login.html");
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="index.css">
    <title>Contactos</title>
</head>
<body>
    <div class="barra_superior" id="barra_superior">

    </div>
    <table>
        <?php
            include 'res/contactos.php';
        ?>
    </table>
</body>
</html>
<script src="index.js"></script>