canvas = document.getElementById("foto_de_perfil_por_defecto");
lienzo = canvas.getContext("2d");

lienzo.lineWith = 1;
lienzo.strokeStyle = "#fff";
lienzo.beginPath();
lienzo.arc(25, 50, 25, 0*Math.PI, 2*Math.PI);
lienzo.moveTo(25, 15);
lienzo.arc(25, 15, 10, 0*Math.PI, 2*Math.PI);
lienzo.fillStyle = "white";
lienzo.fill();
lienzo.stroke();