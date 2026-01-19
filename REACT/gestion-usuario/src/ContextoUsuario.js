import React, { createContext, useState } from 'react';

export const ContextoUsuario = createContext();

export const ProveedorUsuario = ({ children }) => {
    const [usuarios, setUsuarios] = useState([]);

    const añadirUsuario = (nombre, estado) => {
        const nuevoUsuario = {
            id: Date.now(),
            nombre, estado, fecha: new Date().toLocaleDateString(), comentarios: []
        };
        setUsuarios([...usuarios, nuevoUsuario]);
    };

    const añadirComentario = (idUsuario, texto) => {
        setUsuarios(usuarios.map(u =>
            u.id === idUsuario ? { ...u, comentarios: [...u.comentarios, texto] } : u
        ));
    };

    return (
        <ContextoUsuario.Provider value={{ usuarios, añadirUsuario, añadirComentario }}>
            {children}
        </ContextoUsuario.Provider>
    );
};