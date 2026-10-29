// Counts down the seat hold on the cart and payment pages. When it runs out, the cart reloads
// and says the seats went back on sale (the server releases them on that request).
document.querySelectorAll('[data-hold-seconds]').forEach(function (el) {
    var left = parseInt(el.getAttribute('data-hold-seconds'), 10);
    var show = function () {
        var seconds = left % 60;
        el.textContent = Math.floor(left / 60) + ':' + (seconds < 10 ? '0' : '') + seconds;
    };
    show();
    var timer = setInterval(function () {
        left--;
        if (left <= 0) {
            clearInterval(timer);
            window.location.href = 'OrderCart.aspx?expired=1';
            return;
        }
        show();
    }, 1000);
});
