import React from 'react';
import { ProveedorUsuario } from './ContextoUsuario';
import UserForm from './UserForm'; 
import ListaUsuarios from './ListaUsuarios';
import './App.css';

function App() {
  return (
    <ProveedorUsuario>
      <div className="App">
        [cite_start]<h1>Gestión de Personas</h1> 
        <UserForm />
        <hr />
        <ListaUsuarios />
      </div>
    </ProveedorUsuario>
  );
}

export default App;