document.addEventListener('DOMContentLoaded', () => {
    const toggleButton = document.getElementById('toggle-details-btn');
    const techDetails = document.getElementById('tech-details');

    toggleButton.addEventListener('click', () => {
        techDetails.classList.toggle('visible');
         const isVisible = techDetails.classList.contains('visible');
        if (isVisible) {
            toggleButton.textContent = 'Ocultar Detalhes';
        } else {
            toggleButton.textContent = 'Mostrar Detalhes do Stack';
        }
    });
});