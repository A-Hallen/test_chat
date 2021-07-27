<?php
session_start();
include 'conectado.php';
$sala = $_POST['id_sala'];
if (isset($_COOKIE['dfñlkgj'])) {
   $galleta = $_COOKIE['dfñlkgj'];
   $GetSessionQuery = mysqli_query($conection, "SELECT Session_id FROM usuarios WHERE COOKIE_ID = '$galleta'");
   $GetSessionArray = mysqli_fetch_array($GetSessionQuery);
   $_SESSION['ID_SESSION'] = $GetSessionArray[0];
}
if (!isset($_SESSION['ID_SESSION'])) {
    header("location: index.php");
} else {
    $stringSession = $_SESSION['ID_SESSION'];
    $GetUserQuery = mysqli_query($conection, "SELECT Nombre FROM usuarios WHERE Session_id = '$stringSession' ");
    $GetUserArray = mysqli_fetch_array($GetUserQuery);
    $nombre = $GetUserArray[0];
    //echo '<script>alert("pingaaa")</script>';
    $GetContacto = mysqli_query($conection, "SELECT id_usuario FROM sala_usuario WHERE id_usuario = '12' AND id_sala = '$sala'");
    $GetContactoArray = mysqli_fetch_array($GetContacto);
    if (mysqli_num_rows($GetContacto) == NULL) {
        header("location: index.php");
    } else {
    }


}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="chat.css">
    <title>
        <?php
        echo $nombre;
        ?>
    </title>
</head>
<body>

    <div class="barra_superior" id="barra_superior">
        <canvas id="retroceder" class="retroceder" height="40px" width="40px" onclick="retroceder_func()"></canvas>
            <img src="res/contacto_default_picture.png" class="foto_contacto">
            <p>
                <!-- php -->
                <?php
                echo $nombre;
                ?>
                <!-- php -->
            </p>
        <div class="ajustes" id="Div_ajustes" onclick="ajustes()">
            <canvas id="canvas" height="40px" width="40px"></canvas>
        </div>
    </div>
    
    <div class="cuerpo" id="cuerpo">
    <!-- Aqui va a ir el código php para imprimir el historial de chat, por el momento dicho historial no va a tener un límite, más tarde si hay que ponerle uno we -->
    <table class="tabla_historial" id="tabla_historial">
        <?php
                $historialConsul = mysqli_query($conection, "SELECT mensaje FROM mensaje WHERE idSala= '1'");
                while ($row = mysqli_fetch_array($historialConsul)) {
                    $mensaje = $row[0].PHP_EOL;
                    echo '<tr><td>', $mensaje, '</td></tr>';
                }

        ?>
    </table>

    </div>
    <div class="Menu_ajustes" id="Menu_ajustes" style="display: none;"></div>
    
    <div class="chat" id="chat">
            <textarea id="texto" oninput="text_area_change()" placeholder="Mensaje"></textarea>
            <canvas id="send_button" class="send_button" height="70px" width="70px" onclick="send_click()"></canvas>
    </div>
</html>
<!--Aqui pasamos nuestro id a jabascript-->
<script type="text/javascript">
    idUsuario = '<?php echo $_SESSION['ID_SESSION'];?>';
</script>
<!--Aqui pasamos el id del remitente, es decir, el que va a recivir nuestros mensajes, la persona con la que vamos a chatear-->
<script type="text/javascript">
    sala = <?php echo $sala[0];?>;
</script>

<script src="chat.js"></script>