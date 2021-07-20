
//Declaracion de variables
const chat = document.getElementById("chat");
const barra_superior = document.getElementById("barra_superior");
const canvas         = document.getElementById("canvas");
const Menu_ajustes   = document.getElementById("Menu_ajustes");
const cuerpo         = document.getElementById("cuerpo");
const Div_ajustes    = document.getElementById("Div_ajustes");
const texto          = document.getElementById("texto");
const send_button    = document.getElementById("send_button");
//añadir evento click para cerrar el menu emergente
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
dibujar_send();
function dibujar_send() {
lienzo = send_button.getContext("2d");
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
function text_area_change() {
    if (texto.scrollHeight < 200) {
        texto.style.height = "auto";
        chat.style.height  = "auto";
        texto.style.height = texto.scrollHeight + 'px';
        chat.style.height = texto.scrollHeight + 'px';
    }
    
}