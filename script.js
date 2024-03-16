document.addEventListener('DOMContentLoaded', function() {
    window.addEventListener('message', function(event) {
        var container = document.getElementById('container');
        var carpoints = document.getElementById('carpoints');

        if (event.data.action == 'updatePoints') {
            carpoints.innerText = event.data.points + ' SP'; 
            container.style.display = 'block';
            container.classList.add('animation');
            setTimeout(function() {
                container.classList.remove('animation');
            }, 1500);
            
        } else if (event.data.action == 'resetPoints') {
            carpoints.innerText = '0 SP'; 
            container.style.display = 'none';

        }
    });
});
