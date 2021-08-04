//funcion para hacer consultas sincronas a la base de datos
const doQuery = (query, nombre, idUsuario, idSala, text, idTipo, url) => {
    return new Promise((resolve, reject) => {
        con.query(query, [nombre, idUsuario, idSala, text, idTipo, url], (error, results, fields) => {
            if(error) return reject(error);
            return resolve(results);
        });
    });
}
//declaracion de dependencias y algunas variables globales
const mysql = require('mysql');
const express = require('express');
const app = express();
const path = require('path');
var bodyParser = require('body-parser');
var server = require('http').Server(app);
const io = require('socket.io')(server, {//esto es para que no nos de problemas el socket io con el CORS policy etc
    cors: {
      origin: "*",
      methods: ["GET", "POST"]
    }
  });
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());
const cors = require('cors');
app.use(cors({origin:'*'}));

//Aqui comienza la logica de las salas de chat
io.on('connection', function (client) {
    client.on('join', function (data) {
        console.log('unido a la sala' + data.sala);
        client.emit('ja');
      
      
      
      //Aqui es donde recivimos los mensajes del cliente A y se lo mandamos al cliente b
      //Aqui se encuentran las variables que envía el cliente en formato JSON
      var idUsuario = data.idUsuario;
      var idSala    = data.sala;
      var text      = data.textoValue;
      var nombre    = data.nombre
      var idTipo    = data.idTipo;
      var url       = data.url;

    console.log(nombre);
        // si deseo utilizar el resultado de la consulta,
        // debo crear una función asíncrona y llamar a doQuery() usando await.
        const doStuffWithResults = async () => {
            //Estas son las consultas que se le va a realizar a la base de datos.
            const insertarMensaje = "INSERT INTO `mensaje`(`id`, `nombre`, `idUsuario`, `idSala`, `mensaje`, `fecha`, `idTipo`, `url`) VALUES (NULL, ?, ?, ?, ?, CURRENT_TIMESTAMP, ?, ?)";


            const consulEnviarMensaje = await doQuery(insertarMensaje,nombre, idUsuario, idSala, text, idTipo, url);
            // Aquí puedes usar el resultado de tu consulta
            
        }
    
        // llamamos a nuestro método
        doStuffWithResults();

})
})
var con = mysql.createConnection({
  host: "localhost",
  database: "chat",
  user: "root",
  password: "root"
});

con.connect(function (err) {
    if (err) {
        console.error('Error de conexión: ' + err.stack);
        return;
    }
    console.log('Conectado con el identificador ' + con.threadId);
})


//Aqui inicia el servidor
function iniciar() {
    server.listen(3000, '192.168.13.17', function () {  
        var host = server.address().address  
      var port = server.address().port  
    console.log("Server listening at http://%s:%s", host, port);
    }).on('error', (e) =>{
        if('EADDRNOTAVAIL') {   
            console.log("Direccion ip no disponible");            
            return;         
        }
        console.error(e);
        throw e;
    }); 
}
iniciar();