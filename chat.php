<?php
session_start();
header('Content-Type: text/html; charset=utf-8');
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
    //buscamos el nombre del usuario en la bd
    $stringSession = $_SESSION['ID_SESSION'];
    $GetUserQuery = mysqli_query($conection, "SELECT Nombre FROM usuarios WHERE Session_id = '$stringSession' ");
    $GetUserArray = mysqli_fetch_array($GetUserQuery);
    $nombre = $GetUserArray[0];
    //echo '<script>alert("pingaaa")</script>';
    //Nos aseguramos de que el usuario realmente está activo en esta sala
    $SalaVerification = mysqli_query($conection, "SELECT id_usuario FROM sala_usuario WHERE id_usuario = '$stringSession' AND id_sala = '$sala'");
    if (mysqli_num_rows($SalaVerification) == NULL) {
        header("location: index.php");
    } else {
        //Obtenemos el id de la otra persona que se encuentra en la sala  $contactoId
    $GetContactoQueryId = mysqli_query($conection, "SELECT id_usuario FROM sala_usuario WHERE id_usuario != '$stringSession' AND id_sala = '$sala'");
    $GetContactoArrayId = mysqli_fetch_array($GetContactoQueryId);
    $contactoId = $GetContactoArrayId[0];

    $ContactoNameQuery = mysqli_query($conection, "SELECT Nombre FROM usuarios WHERE Nombre = '$contactoId'");
    $ContactoNameArray = mysqli_fetch_array($ContactoNameQuery);
    $contactoName = $ContactoNameArray[0];
    }


}
?>
<!DOCTYPE html>
<html lang="es">

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
            <?php
                echo $contactoName;
            ?>
        </p>
        <div class="ajustes" id="Div_ajustes" onclick="ajustes()">
            <canvas id="canvas" height="40px" width="40px"></canvas>
        </div>
    </div>

    <div class="cuerpo" id="cuerpo">
        <!-- Aqui va a ir el código php para imprimir el historial de chat, por el momento dicho historial no va a tener un límite, más tarde si hay que ponerle uno we -->
        <div class="table_div">

            <table class="tabla_historial" id="tabla_historial">
                <?php
                    $historialConsul = mysqli_query($conection, "SELECT * FROM mensaje WHERE idSala= '$sala'");
                    while ($row = mysqli_fetch_array($historialConsul)) {
                        $mensaje   = $row[4];
                        $titulo    = $row[1];
                        $idUsuario = $row[2];
                        $fecha     = $row[5];
                        if ($stringSession == $idUsuario) {
                            echo '<tr class="trTu"><td class="nombre">Tu</td><td>', utf8_encode($mensaje), '</td><td class="fecha">', $fecha, '</td></tr>';
                        } else {
                            echo '<tr class="trOther"><td class="nombre">', $titulo, '</td><td>', utf8_encode($mensaje), '</td><td class="fechaOther">', $fecha, '</td></tr>';
                        }
                    }  
                ?>
            </table>
        </div>

    </div>
    <div class="Menu_ajustes" id="Menu_ajustes" style="display: none;">
        <ul class="lista">
            <li class="element">
                    Personalización
            </li>            
        </ul>
    </div>

    <div class="chat" id="chat">
        <textarea id="texto" oninput="text_area_change()" placeholder="Mensaje"></textarea>
        <canvas id="send_button" class="send_button" height="70px" width="70px" onclick="send_click()"></canvas>
    </div>

</html>
<!--Aqui pasamos nuestro id a jabascript-->
<script type="text/javascript">
idUsuario = '<?php echo $_SESSION['ID_SESSION'];?>';
sala = <?php echo $sala;?>;
nombre = '<?php echo $nombre; ?>';
</script>
<!--Aqui pasamos el id del remitente, es decir, el que va a recivir nuestros mensajes, la persona con la que vamos a chatear-->


<script src="chat.js"></script>