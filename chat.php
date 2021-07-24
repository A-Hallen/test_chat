<?php
//Se busca en la computadora del usuario si existe alguna cookie llamada ID_USUARIO si no se encuentra se redirije a loguear
$a            = $_COOKIE["ID_USUARIO"];
$destinatario = $_POST["id"];
$nombre       = $_POST["nombre"];
include 'conectado.php';//llamamos al archivo conectado que nos conecta a la base de datos
//$consulta = mysqli_query($conection, "SELECT Nombre FROM usuarios WHERE id = '12'");
//$result   = mysqli_fetch_array($consulta);
//echo 'Este es el resultado: ';
//echo $result;
$salaQuery            = mysqli_query($conection, "SELECT id_sala FROM sala_usuario WHERE id_usuario = '13' AND id_usuario2 = '12'");
$sala                 = mysqli_fetch_array($salaQuery);
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
    <link rel="stylesheet" href="chat.css">
    <title>chat</title>
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
    
    <div class="cuerpo" id="cuerpo"></div>
    <div class="Menu_ajustes" id="Menu_ajustes" style="display: none;"></div>
    
    <div class="chat" id="chat">
            <textarea id="texto" oninput="text_area_change()" placeholder="Mensaje"></textarea>
            <canvas id="send_button" class="send_button" height="70px" width="70px" onclick="send_click()"></canvas>
    </div>
</html>
<!--Aqui pasamos nuestro id a jabascript-->
<script type="text/javascript">
    idUsuario = '<?php echo $a;?>';
</script>
<!--Aqui pasamos el id del remitente, es decir, el que va a recivir nuestros mensajes, la persona con la que vamos a chatear-->
<script type="text/javascript">
    sala = <?php echo $sala[0];?>;
</script>

<script src="chat.js"></script>