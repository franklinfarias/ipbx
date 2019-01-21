
/* ==============================================
CHART 6: CIRCLIFUL CIRCLE CHARTS 
=============================================== */
$(window).scroll(function () {
    if ($('#pie_chart1').visible()) {
        if ($('.circle-text-half').length == 0) {
            $('#pie_chart1').circliful();
            $('#pie_chart2').circliful();
            $('#pie_chart3').circliful();
            $('#pie_chart4').circliful();
        }
    }
});

$(window).resize(function () {
    new Morris.Donut({
        element: 'donut-chart1',
        data: [{
            label: "Chrome",
            value: 34
        }, {
            label: "Firefox",
            value: 24
        }, {
            label: "Opera",
            value: 12
        }, {
            label: "Safari",
            value: 25
        }, {
            label: "Internet Explorer",
            value: 5
        }],
        colors: ['#C75757', '#18A689', '#0090D9', '#2B2E33', '#0090D9'],
        formatter: function (x) {
            return x + "%"
        }
    });
    $('#pie_chart1').html('');
    $('#pie_chart2').html('');
    $('#pie_chart3').html('');
    $('#pie_chart4').html('');
    if ($('.circle-text-half').length == 0) {
        $('#pie_chart1').circliful();
        $('#pie_chart2').circliful();
        $('#pie_chart3').circliful();
        $('#pie_chart4').circliful();
    }
});



















