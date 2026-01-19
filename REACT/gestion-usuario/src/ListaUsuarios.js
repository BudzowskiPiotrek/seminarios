import React, { useContext, useState } from 'react';
import { ContextoUsuario } from './ContextoUsuario';

const ListaUsuarios = () => {
    const { usuarios, añadirComentario } = useContext(ContextoUsuario);
    const [idActivo, setIdActivo] = useState(null);
    const [comentNuevo, setComentNuevo] = useState('');

    return (
        <div className="user-list">
            {usuarios.map(u => (
                <div key={u.id} className="user-card" onClick={() => setIdActivo(u.id)}>
                    <h3>{u.nombre} — {u.estado}</h3>
                    <p>Fecha del estado: {u.fecha} 📄</p>

                    {idActivo === u.id && (
                        <div className="modal">
                            <h4>{u.nombre}</h4>
                            <p>Comentarios:</p>
                            {u.comentarios && u.comentarios.map((c, i) => (
                                <div key={i} className="comment-box">{c}</div>
                            ))}
                            <textarea
                                placeholder="Escrivir comentario..."
                                value={comentNuevo}
                                onChange={(e) => setComentNuevo(e.target.value)}
                            />
                            <button onClick={() => { añadirComentario(u.id, comentNuevo); setComentNuevo(''); }}>
                                Guardar comentarioo
                            </button>
                            <button onClick={(e) => { e.stopPropagation(); setIdActivo(null); }}>Cerrar secion</button>
                        </div>
                    )}
                </div>
            ))}
        </div>
    );
};

export default ListaUsuarios;