$(function () {
    $.ajax({
        url: '/countdown/load_deadline',
        success: function(data){
            var countDownDate = new Date(data["deadline"]).getTime();
            var x = setInterval(function() {
                var now = new Date().getTime();
                var distance = countDownDate - now;
                var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = Math.floor((distance % (1000 * 60)) / 1000);
                $(".days").text(prepandZero(days));
                $(".hours").text(prepandZero(hours));
                $(".minutes").text(prepandZero(minutes));
                $(".seconds").text(prepandZero(seconds));

                if (distance < 0) {
                    clearInterval(x);
                    $(".countdown").text("EXPIRED");
                }
            }, 1000);
        }
    });

    function prepandZero(n){
        n = parseInt(n);
        var ret = n > 9 ? "" + n: "0" + n;
        return ret;
    }
});