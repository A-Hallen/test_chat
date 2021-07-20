var mysql = require('mysql');
const { ContextExclusionPlugin } = require('webpack');

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
con.query("SELECT Nombre FROM usuarios WHERE id = '12'", function (error, results, fields) {
    if (error)
        throw error;
        results.forEach(result => {
            console.log(result.Nombre);
        });
    
});