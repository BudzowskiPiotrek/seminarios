document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('formEmpleado');
    const tablaBody = document.querySelector('#tablaEmpleados tbody');

    cargarEmpleados();

    form.addEventListener('submit', async (e) => {
        e.preventDefault();

        const nombre = document.getElementById('nombre').value;
        const rol = document.getElementById('rol').value;

        if (!nombre || !rol) {
            alert("Por favor, completa todos los campos");
            return;
        }

        const data = { nombre, rol };

        try {
            const res = await fetch('/empleados', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(data)
            });

            if (!res.ok) throw new Error('Error al registrar');

            form.reset();
            cargarEmpleados();
        } catch (err) {
            console.error(err);
        }
    });

    async function cargarEmpleados() {
        try {
            const res = await fetch('/empleados');
            const empleados = await res.json();

            tablaBody.innerHTML = '';

            empleados.forEach(emp => {
                const fila = document.createElement('tr');
                fila.innerHTML = `
                    <td>${emp.id}</td>
                    <td>${emp.nombre}</td>
                    <td>${emp.rol}</td>
                `;
                tablaBody.appendChild(fila);
            });
        } catch (err) {
            console.error('Error al cargar empleados:', err);
        }
    }
});
