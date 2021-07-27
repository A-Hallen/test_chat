<?php
session_start();
include 'conectado.php';
if (isset($_COOKIE['dfñlkgj'])) {
   $galleta = $_COOKIE['dfñlkgj'];
   $GetSessionQuery = mysqli_query($conection, "SELECT Session_id FROM usuarios WHERE COOKIE_ID = '$galleta'");
   $GetSessionArray = mysqli_fetch_array($GetSessionQuery);
   $_SESSION['ID_SESSION'] = $GetSessionArray[0];
}
if (!isset($_SESSION['ID_SESSION'])) {
    header("location: /login.html");
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