const mysql = require('mysql');

const conexion = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'seminario'
});

conexion.connect((error) => {
    if (error) {
        console.error("El error de conexion es: " + error);
        return
    }
    console.log("Conexion con BD con éxito.");
});

module.exports = conexion