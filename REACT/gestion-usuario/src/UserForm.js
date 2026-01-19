import React, { useState, useContext } from 'react';
// Cambiamos la importación para que use el nuevo nombre del archivo y la variable
import { ContextoUsuario } from './ContextoUsuario';

const UserForm = () => {
    const [nombre, setNombre] = useState('');
    const [estatus, setEstatus] = useState('Activo');
    const { añadirUsuario } = useContext(ContextoUsuario);

    const enviarFormu = (e) => {
        e.preventDefault();
        if (!nombre) {
            alert("Pone un nombre primero"); // Un alert sencillito
            return;
        }
        añadirUsuario(nombre, estatus);
        setNombre('');
    };

    return (
        <form onSubmit={enviarFormu} className="form-container">
            <input
                type="text"
                placeholder="Nombre de la persona"
                value={nombre}
                onChange={(e) => setNombre(e.target.value)}
            />
            <select value={estatus} onChange={(e) => setEstatus(e.target.value)}>
                <option value="Activo">Activo</option>
                <option value="Inactivo">Inactivo</option>
            </select>
            <button type="submit">Agregar</button>
        </form>
    );
};

export default UserForm;