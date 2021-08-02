<?php
//llamamos al archivo que inicia nuestra conexion con la base de datos
include 'conectado.php';
$usuario       = $_POST['usuario'];
$password      = $_POST['password'];
$recordar      = $_POST['recordar'];
$email         = $_POST['email'];
$random_string = bin2hex(random_bytes(20));//generamos un string aleatorio que vamos a ultilizar como id de session
//hasheamos la contraseña para que quede completamente cifrada
$password=  password_hash($password, PASSWORD_DEFAULT);
$usuario = filter_var($usuario, FILTER_SANITIZE_STRING);//Nos aseguramos de que no nos hagan una inyección de SQL antes de manipular la BD
$email   = filter_var($email, FILTER_SANITIZE_STRING);
///////////////////////////////////
if ($usuario == false || $email == false) {//si se trata de una inyeccion SQL, la ejecución del script termina mandándote a el login otra vez por troll ;)
    header("location: /registrar.html");
} else {

    if (isset($recordar)) {//Si la casilla recordar está marcada guardamos una cookie con un string aleatorio en el cliente y en la BD
        if (!isset($_COOKIE['dfñlkgj'])) {
            setcookie('dfñlkgj', $random_string, time() + 365 * 24* 60*60);
        }
        
    }
    $queryInsertUser = mysqli_query($conection, "INSERT INTO usuarios (Nombre, Password, Correo, Session_id) VALUES ('$usuario', '$password', '$email', '$random_string')");
    if (!$queryInsertUser) {
        echo '<script>alert()</script>';    
    }
    session_start();
    if (!isset($_SESSION['ID_SESSION'])) {
        $_SESSION['ID_SESSION'] = $random_string;
    }


}
?>