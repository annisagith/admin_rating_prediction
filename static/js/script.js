const hamburger = document.querySelector("#toggle-btn");

hamburger.addEventListener("click", function() {
    document.querySelector("#sidebar").classList.toggle("expand");
});

// Setelah 3 detik, alert akan menghilang pelan-pelan, lalu dihapus dari DOM
setTimeout(function() {
let alerts = document.querySelectorAll('.alert');
alerts.forEach(function(alert) {
    alert.classList.remove('show');
    alert.classList.add('hide');
    
    // Setelah transisi selesai (500ms), hapus dari DOM
    setTimeout(function() {
    alert.remove();
    }, 300); // 0.5 detik sesuai animasi CSS
});
}, 1500);


