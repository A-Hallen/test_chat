<?php
include 'conectado.php';//llamamos al archivo conectado que nos conecta a la base de datos

//Busca en la base de datos los contactos que tiene el usuario actual, gracias a su id claro está
$id_contactos     = mysqli_query($conection, "SELECT ID_CONTACTO FROM contactos WHERE id = '12'");
$numero = mysqli_fetch_array($id_contactos);
// si quieres imprimir el 13 seria   echo $numero[0]["ID_CONTACTO"]   
// si quieres imprimir el 14 seria   echo $numero[1]["ID_CONTACTO"] 
//Luego busca en la base de datos los nombres de los contactos que corresponden al usuario actual
$nombre_contactos = mysqli_query($conection, "SELECT Nombre FROM usuarios WHERE id = '$numero[0]'");
$nombre = mysqli_fetch_array($nombre_contactos);//Se almacenan en un array
if (!$id_contactos) {
    echo ' No se encontraron contactos o la consulta arrojó un error';
} else {
    //Imprime en pantalla los contactos con ayuda de un bucle for
    for ($i=0; $i < sizeof($nombre); $i++) { 
        echo '
        <tr>
        <td class="td_foto">
        <img src= "res/contacto_default_picture.png">
        </td>
        <td class="td_nombre">', $numero[0]  ,  '</td>
        </tr>';
    }
}



?>
