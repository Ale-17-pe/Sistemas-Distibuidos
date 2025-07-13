document.addEventListener('DOMContentLoaded', function() {
    // Habilitar edición al hacer clic en los botones de editar
    document.querySelectorAll('.edit-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const input = this.parentElement.querySelector('input, select, textarea');
            if (input.disabled) {
                input.disabled = false;
                this.innerHTML = '<i class="fas fa-save"></i>';
                input.focus();
            } else {
                input.disabled = true;
                this.innerHTML = '<i class="fas fa-edit"></i>';
            }
        });
    });

    // Validación del formulario
    document.getElementById('profileForm').addEventListener('submit', function(e) {
        const telefono = document.getElementById('telefono').value;
        if (!/^[0-9]{9}$/.test(telefono)) {
            e.preventDefault();
            alert('El teléfono debe tener 9 dígitos');
            return;
        }
        
        // Agregar más validaciones según sea necesario
    });

    // Mostrar feedback de éxito/error
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has('success')) {
        alert('Perfil actualizado correctamente');
    } else if (urlParams.has('error')) {
        alert('Error al actualizar el perfil: ' + urlParams.get('error'));
    }
});