const chat            = document.getElementById("chat");
const barra_superior  = document.getElementById("barra_superior");
const canvas          = document.getElementById("canvas");
const Menu_ajustes    = document.getElementById("Menu_ajustes");
const cuerpo          = document.getElementById("cuerpo");
const Div_ajustes     = document.getElementById("Div_ajustes");
const texto           = document.getElementById("texto");
const send_button     = document.getElementById("send_button");
const retroceder      = document.getElementById("retroceder");
const historial       = document.getElementById("tabla_historial");
//enviar saludo al servidor node js mediante un socket
var socket = io.connect('http://192.168.13.17:3000/');
socket.on('connect', function(){
    socket.on('ja', function() {
        console.log('hola mundo desde el server');
    })
});
//////////////
document.onload = scrollFunc();

//a�adir evento click para cerrar el menu emergente
cuerpo.addEventListener('click', out);
function out() {
    Menu_ajustes.style.display = "none";
    Div_ajustes.style.display       = "block";
}
//evento que muestra el menu emergente
function ajustes() {
    Div_ajustes.style.display       = "none";
    Menu_ajustes.style.display = "block";
}
//canvas del icono de menu (El que tiene 3 punticos verticales we)
dibujar();
dibujar_send();
dibujar_retroceder();
function scrollFunc() {
    historial.scrollTop = historial.scrollHeight - historial.clientHeight;
}
function dibujar(){
let lienzo = canvas.getContext("2d");
lienzo.strokeStyle = "#afafaf";
lienzo.lineWidth = 4;
lienzo.beginPath();
lienzo.moveTo(20, 10);
lienzo.arc(20, 10, 2, 0*Math.PI, 2*Math.PI);
lienzo.moveTo(20, 20);
lienzo.arc(20, 20, 2, 0*Math.PI, 2*Math.PI);
lienzo.moveTo(20, 30);
lienzo.arc(20, 30, 2, 0*Math.PI, 2*Math.PI);
lienzo.stroke();}
//fin del canvas
//canvas del emoji que aparece al lado del area de texto
function dibujar_send() {
let lienzo = send_button.getContext("2d");
lienzo.moveTo(10, 10);
lienzo.lineTo(60, 35);
lienzo.lineTo(10, 60);
lienzo.lineTo(20, 47);
lienzo.lineTo(20, 40);
lienzo.lineTo(35, 35);
lienzo.lineTo(20, 30);
lienzo.lineTo(20, 23);
lienzo.lineTo(10, 10);
lienzo.fillStyle = "white";
lienzo.fill();
lienzo.stroke();
}
//fin del canvas
//funcion que se utiliza para agrandar el area de texto cuando el mensaje es muy grande
function text_area_change() {
    if (texto.value == "") {
        texto.style.height = texto.scrollHeight + 'px';
        chat.style.height = texto.scrollHeight + 'px';  
    }
    if (texto.scrollHeight < 200) {
        texto.style.height = "auto";
        chat.style.height  = "auto";
        texto.style.height = texto.scrollHeight + 'px';
        chat.style.height = texto.scrollHeight + 'px';
    }
    
}
//funcion para el boton de retroceder
function retroceder_func() {
    window.history.go(-1);
}
//funcion que dibuja el boton retroceder
function dibujar_retroceder() {
 let lienzo = retroceder.getContext("2d");
 lienzo.lineWidth = 2;
 lienzo.strokeStyle = "#fff";
 lienzo.moveTo(10, 20);
 lienzo.lineTo(30, 20);
 lienzo.moveTo(20, 10);
 lienzo.lineTo(10, 20);
 lienzo.lineTo(20, 30);

 lienzo.stroke();
}
texto. addEventListener('keypress', function(event) {
    var key = window.event.keyCode;
    if (key == 13) {
        event.preventDefault();
        send_click();
    }
});
//funcion para enviar el mensaje
function send_click() {

    if (texto.value == '') {
        return;
    }


    historial.insertAdjacentHTML('beforeend', '<tr class="trTu"><td class="nombre">' + nombre + '</td><td>' + texto.value + '</td><td class="fecha">Ahora</td></tr>');
    historial.scrollTop = historial.scrollHeight - historial.clientHeight;
    text_area_change();
    //conectamos el socket.io y volvemos a establecer la conexion con el server por el canal join
    var socket = io.connect('http://192.168.13.17:3000/');
    textoValue = texto.value;
    url = null;
    idTipo = 1;
    socket.emit('join', {idUsuario, sala, textoValue, nombre, idTipo, url});
    /////////////////////
    //Despues de enviar el mensaje borramos el contenido de la caja de texto
    texto.value = '';
}