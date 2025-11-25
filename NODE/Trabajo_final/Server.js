const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const conexion = require('./DB');
const path = require('path');

const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname)));

app.get('/empleados', (req, res) => {
    const sql = 'SELECT * FROM empleados';
    conexion.query(sql, (err, result) => {
        if (err) {
            res.status(500).send('Error al obtener empleados');
            return;
        }
        res.json(result);
    });
});

app.post('/empleados', (req, res) => {
    const { nombre, rol } = req.body;
    const sql = 'INSERT INTO empleados (nombre, rol) VALUES (?, ?)';
    conexion.query(sql, [nombre, rol], (err, result) => {
        if (err) {
            res.status(500).send('Error al registrar empleado');
            return;
        }
        res.json({ message: 'Empleado agregado correctamente' });
    });
});

app.listen(port, () => {
    console.log(`Servidor escuchando en http://localhost:${port}`);
});
