$(function () {
    /* ==============================================
     FLOTCHART: FLOT LINE & BARS CHARTS
     =============================================== */
    var lineChart = [{
        label: "Entrantes",
        data: dataEntrantes,
        lines: {
            lineWidth: 2
        },
        shadowSize: 0,
        color: '#3598DB'
    }, {
        label: "Entrantes",
        data: dataEntrantes,
        points: {
            show: true,
            fill: true,
            radius: 6,
            fillColor: "#3598DB",
            lineWidth: 3
        },
        color: '#fff'
    }, {
        label: "Saintes",
        data: dataSaintes,
        animator: {
            steps: 300,
            duration: 1000,
            start: 0
        },
        lines: {
            fill: 0.6,
            lineWidth: 0,
        },
        color: '#99cbed'
    }, {
        label: "Saintes",
        data: dataSaintes,
        points: {
            show: true,
            fill: true,
            radius: 6,
            fillColor: "#badcf3",
            lineWidth: 3
        },
        color: '#fff'
    }, ];

    var barChart = [{
        // Entrantes
        label: "Entrantes",
        data: dataEntrantesMes,
        color: '#00b5f3'
    }, {
        // Saintes
        label: "Saintes",
        data: dataSaintesMes,
        color: '#008fc0',
        points: {
            radius: 4,
            fillColor: '#008fc0'
        }
    }];

    function plotChart01(){
        var plot = $.plotAnimator($('#flotChart01'), lineChart, {
            xaxis: {
                tickLength: 0,
                tickDecimals: 0,
                min: 2,
                ticks: [
                    [0, '08:00'], [1, '09:00'], [2, '10:00'], [3, '11:00'], [4, '12:00'], [5, '13:00'], [6, '14:00'], [7, '15:00'], [8, '14:00'],  [9, '17:00'], [10, '18:00'], [11, '19:00']
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
                borderColor: "#f3f3f3",
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

    function plotChart02(){
        plot2 = $.plotAnimator($('#flotChart02'), barChart, {
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
    // Create Chart Line
    plotChart01();

    // Tooltip
    $("#flotChart01").bind("plothover", function (event, pos, item) {
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

    $("#flotChart02").bind("plothover", function (event, pos, item) {
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

    $("#flotChart01").on("animatorComplete", function () {
        $("#lines, #bars").removeAttr("disabled");
    });

    $("#lines").on("click", function () {
        $('#btnTitle').html('Chamadas Entrantes x Saintes por Hora');
        $('#bars').removeClass('active');
        $('#flotChart02').fadeOut();
        $(this).addClass('active');
        $("#lines, #bars").attr("disabled", "disabled");
        $('#flotChart01').fadeIn();
        plotChart01();
    });

    $("#flotChart02").on("animatorComplete", function () {
        $("#bars, #lines").removeAttr("disabled")
    });

    $("#bars").on("click", function () {
        $('#btnTitle').html('Chamadas Entrantes x Saintes por Mês');
        $("#bars, #lines").attr("disabled", "disabled");
        $('#lines').removeClass('active');
        $('#flotChart01').fadeOut();
        $(this).addClass('active');
        $('#flotChart02').fadeIn().removeClass('hidden');
        plotChart02();
    });

    $('#flotChart02').hide();

    /* ==============================================
     USER PROFILE: CIRCLIFUL CIRCLE CHARTS
     =============================================== */
    $(window).scroll(function () {
        if ($('#pieChart01').visible()) {
            if ($('.circle-text-half').length == 0) {
                $('#pieChart01').circliful();
                $('#pieChart02').circliful();
            }
        }
    });

    $(window).resize(function () {

        $('#pieChart01').html('');
        $('#pieChart02').html('');
        if ($('.circle-text-half').length == 0) {
            $('#pieChart01').circliful();
            $('#pieChart02').circliful();
        }
    });

});



















