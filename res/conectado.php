<?php
$conection    = mysqli_connect("localhost", "root", "root", "chat");
$codificacion = mysqli_set_charset($conection, "UTF-8");

if (!$conection) {
    echo 'Error al conectar a la base de datos chat';
} else {
}

?>