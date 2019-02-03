$(function () {

    /* Display message header */
    setTimeout(function () {
        $('#chat-notification').removeClass('hide').addClass('animated bounceIn');
        $('#chat-popup').removeClass('hide').addClass('animated fadeIn');
    }, 5000);

    /* Hide message header */
    setTimeout(function () {
        $('#chat-popup').removeClass('animated fadeIn').addClass('animated fadeOut').delay(800).hide(0);
    }, 8000);

    //****************** LINE & BAR SWITCH CHART ******************//
    // --->>> MOVIDO PARA A PAGINA
    //var d1 = [
    //    [0, 950], [1, 1300], [2, 1600], [3, 1900], [4, 2100], [5, 2500], [6, 2200], [7, 2000], [8, 1950], [9, 1900], [10, 2000], [11, 2120]
    //];
    //var d2 = [
    //    [0, 450], [1, 500], [2, 600], [3, 550], [4, 600], [5, 800], [6, 900], [7, 800], [8, 850], [9, 830], [10, 1000], [11, 1150]
    //];

    var tickArray = ['Janv', 'Fev', 'Mars', 'Apri', 'May', 'June', 'July', 'Augu', 'Sept', 'Nov'];

    /****  Line Chart  ****/
    var graph_lines = [{
        label: "Entrantes",
        data: dataLine1,
        lines: {
            lineWidth: 2
        },
        shadowSize: 0,
        color: '#0090D9'
    }, {
        label: "Entrantes",
        data: dataLine1,
        points: {
            show: true,
            fill: true,
            radius: 6,
            fillColor: "#0090D9",
            lineWidth: 3
        },
        color: '#fff'
    }, {
        label: "Saintes",
        data: dataLine2,
        animator: {
            steps: 300,
            duration: 1000,
            start: 0
        },
        lines: {
            fill: 0.7,
            lineWidth: 0,
        },
        color: '#18A689'
    }, {
        label: "Saintes",
        data: dataLine2,
        points: {
            show: true,
            fill: true,
            radius: 6,
            fillColor: "#18A689",
            lineWidth: 3
        },
        color: '#fff'
    }, {
        label: "Abandonadas",
        data: dataLine3,
        animator: {
            steps: 300,
            duration: 1000,
            start: 0
        },
        lines: {
            fill: 0.7,
            lineWidth: 0,
        },
        color: '#C75757'
    }, {
        label: "Abandonadas",
        data: dataLine3,
        points: {
            show: true,
            fill: true,
            radius: 6,
            fillColor: "#C75757",
            lineWidth: 3
        },
        color: '#fff'
    }, ];

    function lineCharts(){
        var line_chart = $.plotAnimator($('#graph-lines'), graph_lines, {
            xaxis: {
                tickLength: 0,
                tickDecimals: 0,
                min: 0,
                ticks: [
                    [0, '08:00'], [1, '09:00'], [2, '10:00'], [3, '11:00'], [4, '12:00'], [5, '13:00'], [6, '14:00'], [7, '15:00'], [8, '16:00'],  [9, '17:00'], [10, '18:00'], [11, '19:00']
                ],
                font: {
                    lineHeight: 12,
                    weight: "bold",
                    family: "Open sans",
                    color: "#8D8D8D"
                }
            },
            yaxis: {
                ticks: 3,
                tickDecimals: 0,
                tickColor: "#f3f3f3",
                font: {
                    lineHeight: 13,
                    weight: "bold",
                    family: "Open sans",
                    color: "#8D8D8D"
                }
            },
            grid: {
                backgroundColor: {
                    colors: ["#fff", "#fff"]
                },
                borderColor: "transparent",
                margin: 0,
                minBorderMargin: 0,
                labelMargin: 15,
                hoverable: true,
                clickable: true,
                mouseActiveRadius: 4
            },
            legend: {
                show: false
            }
        });
    }
    lineCharts();

    /****  Bars Chart  ****/
    var graph_bars = [{
        // Entrantes
        label: "Entrantes",
        data: dataBar1,
        color: '#00b5f3'
    }, {
        // Saintes
        label: "Saintes",
        data: dataBar2,
        color: '#18A689',
        points: {
            radius: 4,
            fillColor: '#18A689'
        }
    }, {
        // Abandonadas
        label: "Abandonadas",
        data: dataBar3,
        color: '#C75757',
        points: {
            radius: 4,
            fillColor: '#C75757'
        }
    }];

    function barCharts(){
        bar_chart = $.plotAnimator($('#graph-bars'), graph_bars, {
            series: {
                bars: {
                    fill: 1,
                    show: true,
                    barWidth: .6,
                    align: 'center'
                },
                shadowSize: 0
            },
            xaxis: {
                tickColor: 'transparent',
                ticks: [
                    [0, 'Jan'], [1, 'Fev'], [2, 'Mar'], [3, 'Apr'], [4, 'May'], [5, 'Jun'], [6, 'Jul'], [7, 'Aug'], [8, 'Sept'], [9, 'Oct'], [10, 'Nov'], [11, 'Dec']
                ],
                font: {
                    lineHeight: 12,
                    weight: "bold",
                    family: "Open sans",
                    color: "#9a9a9a"
                }
            },
            yaxis: {
                ticks: 3,
                tickDecimals: 0,
                tickColor: "#f3f3f3",
                font: {
                    lineHeight: 13,
                    weight: "bold",
                    family: "Open sans",
                    color: "#9a9a9a"
                }
            },
            grid: {
                backgroundColor: {
                    colors: ["#fff", "#fff"]
                },
                borderColor: "transparent",
                margin: 0,
                minBorderMargin: 0,
                labelMargin: 15,
                hoverable: true,
                clickable: true,
                mouseActiveRadius: 4
            },
            legend: {
                show: false
            }
        });
    }

    $("#graph-lines").on("animatorComplete", function () {
        $("#lines, #bars").removeAttr("disabled");
    });

    $("#lines").on("click", function () {
        $('#btnTitle').html('Chamadas Entrantes x Saintes x Aband. por Hora');
        $('#bars').removeClass('active');
        $('#graph-bars').fadeOut();
        $(this).addClass('active');
        $("#lines, #bars").attr("disabled", "disabled");
        $('#graph-lines').fadeIn();
        lineCharts();
    });

    $("#graph-bars").on("animatorComplete", function () {
        $("#bars, #lines").removeAttr("disabled")
    });

    $("#bars").on("click", function () {
        $('#btnTitle').html('Chamadas Entrantes x Saintes x Aband. por Mês');
        $("#bars, #lines").attr("disabled", "disabled");
        $('#lines').removeClass('active');
        $('#graph-lines').fadeOut();
        $(this).addClass('active');
        $('#graph-bars').fadeIn().removeClass('hidden');
        barCharts();
    });

    $('#graph-bars').hide();

    $("#graph-lines").bind("plothover", function (event, pos, item) {
        if (item) {
            var x = item.datapoint[0].toFixed(2),
                y = item.datapoint[1].toFixed(2);

            $("#tooltip").html(item.series.label + " " + y)
                .css({
                    top: item.pageY + 5,
                    left: item.pageX + 5
                })
                .fadeIn(200);
        } else {
            $("#tooltip").hide();
        }
    });

    $("#graph-bars").bind("plothover", function (event, pos, item) {
        if (item) {
            var x = item.datapoint[0].toFixed(2),
                y = item.datapoint[1].toFixed(2);

            $("#tooltip").html(item.series.label + " " + y)
                .css({
                    top: item.pageY + 5,
                    left: item.pageX + 5
                })
                .fadeIn(200);
        } else {
            $("#tooltip").hide();
        }
    });


    //******************** CIRCLIFUL CIRCLE CHARTS ********************//
    $('#pie_chart1').circliful();


    //************** SPARKLINE SMALL CHART *****************//
    $(function () {
        /* Sparklines can also take their values from the first argument passed to the sparkline() function */
        //var myvalues1 = [13, 14, 16, 15, 11, 14, 20, 14, 12, 16, 11, 17];
        //var myvalues2 = [14, 17, 16, 12, 18, 16, 22, 15, 14, 17, 11, 18];
        $('.spark-chart-1').sparkline(dataQueue1, {
            type: 'line',
            lineColor: '#18A689',
            fillColor: '#18A689',
            spotColor: '#18A689',
            height: '32px',
            width: '100%'
        });
        $('.spark-chart-2').sparkline(dataGeneral1, {
            type: 'line',
            lineColor: '#6B787F',
            fillColor: '#0090D9',
            spotColor: '#6B787F',
            height: '32px',
            width: '100%'
        });
    });

    /* We have to recreate charts on resize to make them responsive */
    $(window).resize(function () {
        //var dataQueue1 = [13, 14, 16, 15, 11, 14, 20, 14, 12, 16, 11, 17];
        //var myvalues2 = [14, 17, 16, 12, 18, 16, 22, 15, 14, 17, 11, 18];
        $('.spark-chart-1').sparkline(dataQueue1, {
            type: 'line',
            lineColor: '#18A689',
            fillColor: '#18A689',
            spotColor: '#18A689',
            height: '32px',
            width: '100%'
        });
        $('.spark-chart-2').sparkline(dataGeneral1, {
            type: 'line',
            lineColor: '#6B787F',
            fillColor: '#0090D9',
            spotColor: '#6B787F',
            height: '32px',
            width: '100%'
        });

        // Circufull
        $('#pie_chart1').html('');
        if ($('.circle-text-half').length == 0) {
            $('#pie_chart1').circliful();
        }
    });

    /**/
    $(window).scroll(function () {
        if ($('#pie_chart1').visible()) {
            if ($('.circle-text-half').length == 0) {
                $('#pie_chart1').circliful();
            }
        }
    });


    //******************** TO DO LIST ********************//
    $("#sortable-todo").sortable();

    $('.my_checkbox_all').on('click', function (event) {
        if ($(this).prop('checked') ==  true){
            $(this).closest('#task-manager').find('input:checkbox').prop('checked', true);
        } else {
            $(this).closest('#task-manager').find('input:checkbox').prop('checked', false);
        }
    });

});