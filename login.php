<?php
//llamamos al archivo que inicia nuestra conexion con la base de datos
include 'conectado.php';
$usuario       = $_POST['usuario'];
$password      = $_POST['password'];
$recordar      = $_POST['recordar'];
$random_string = bin2hex(random_bytes(20));//generamos un string aleatorio que vamos a ultilizar como id de session
$usuario  = filter_var($usuario,  FILTER_SANITIZE_STRING);//Nos aseguramos de que no nos hagan una inyección SQL los que se creen hackers
$password = filter_var($password, FILTER_SANITIZE_STRING);//Nos aseguramos de que no nos hagan una inyección SQL los que se creen hackers
///////////////////////////////////

if ($usuario == false || $password == false) {//si se trata de una inyeccion SQL, la ejecución del script termina mandándote a el login otra vez por troll ;)
    header("location: /login.html");
} else {
    $queryComprobar = mysqli_query($conection, "SELECT Password FROM usuarios WHERE Nombre = '$usuario'");//Selecciona la contraseña que se encuentra en la BD
    $hash = mysqli_fetch_array($queryComprobar);//la convierte en un Array
    $verificar = password_verify($password, $hash[0]);//verificamos si la contraseña proporcionada coincide con la de la BD
    if (!$verificar) {
    header("location: /login.html");//Si la contraseña es incorrecta se manda al login otra vez
} else {// de lo contrario continua la ejecucion del script
    if (isset($recordar)) {//Si la casilla recordar está marcada guardamos una cookie con un string aleatorio en el cliente y en la BD
        if (!isset($_COOKIE['dfñlkgj'])) {//Solo si no existe dicha cookie ya
            setcookie('dfñlkgj', $random_string, time() + 365 * 24* 60*60);
            //Se actualiza la session id de la BD
            $queryUpdateSession = mysqli_query($conection, "UPDATE `usuarios` SET `COOKIE_ID`= '$random_string' WHERE Nombre = '$usuario' AND Password = '$hash[0]'");
        }
        
    }
    session_start();//Se inicia la variable de session 
    if (!isset($_SESSION['ID_SESSION'])) {//Solo si no existe
        $getSessionQuery = mysqli_query($conection, "SELECT Session_id FROM usuarios WHERE Nombre = '$usuario'");
        $SessionQueryArray= mysqli_fetch_array($getSessionQuery);
        $_SESSION['ID_SESSION'] = $SessionQueryArray[0];
    }//Se actualiza la session id de la BD
    header("location: /index.php");//Si la contraseña es incorrecta se manda al login otra vez

}
}
?>