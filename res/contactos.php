<?php
include 'conectado.php';//llamamos al archivo conectado que nos conecta a la base de datos

function sala($conection){
    $salaQuery = mysqli_query($conection, "SELECT `id_sala` FROM `sala_usuario` WHERE id_usuario = '12'");
    $i = 0;
    $a = array();
    while ($row = mysqli_fetch_array($salaQuery)) {
        $a[$i] = $row[0];
        $i++;
    }
    return $a;
}

$sesion = $_SESSION['ID_SESSION'];
//Busca en la base de datos los contactos que tiene el usuario actual, gracias a su id claro está
$id_consulta     = mysqli_query($conection, "SELECT  id_sala FROM sala_usuario WHERE id_usuario = '12'");
//test
$indice = 0;
while ($row = mysqli_fetch_array($id_consulta)) {
    //Buscamos el indice de las salas en las que se encuentra el cliente    $sala
    $sala_array = sala($conection);
    $sala = $sala_array[$indice];
    //Buscamos de que tipo de sala se trata, si es grupal o privada         $salaType
    $salaTypeQyery = mysqli_query($conection, "SELECT `idTipo` FROM `sala` WHERE id= '$sala'");
    $salaTypeArray = mysqli_fetch_array($salaTypeQyery);
    $salaType = $salaTypeArray[0];

    //Si es privada se procede a ejecutar el siguiente algoritmo
    if ($salaType == 1) {
        //Se extrae el id de la otra persona que está en la sala            $contacto
        $contactoQuery = mysqli_query($conection, "SELECT `id_usuario` FROM `sala_usuario` WHERE id_usuario != '12' AND id_sala = '$sala'");
        $contactoArray = mysqli_fetch_array($contactoQuery);
        $contacto = $contactoArray[0];

        //Buscamos en la BD el nombre de la persona que tiene ese id        $nombre
        $nombre_contactos = mysqli_query($conection, "SELECT Nombre FROM usuarios WHERE id = '$contacto'");
        $nombre = mysqli_fetch_array($nombre_contactos);//Se almacena en un array
    }
    if (!$id_consulta) {
        echo ' No se encontraron contactos o la consulta arrojó un error';
    } else {
        //Imprime en pantalla los contactos con ayuda de un bucle for
        for ($i=0; $i < sizeof($nombre) - 1; $i++) {
            echo '
            <tr>
            <td class="td_foto">
            <img src= "res/contacto_default_picture.png">
            </td>
            <td class="td_nombre">
            <form action="chat.php" method="post" id="form" onclick="chatear(this)">
            ', $nombre[0], '
            <input type="hidden" name="id_sala" value="', $sala, '">
            </form>
            </td>
            </tr>
            ';
        }
    }
$indice++;
}

//testend

// si quieres imprimir el 13 seria   echo $numero[0]["ID_CONTACTO"]   
// si quieres imprimir el 14 seria   echo $numero[1]["ID_CONTACTO"] 
//Luego busca en la base de datos los nombres de los contactos que corresponden al usuario actual


//repinga asere

?>
