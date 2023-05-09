let chart01 = {
    init: function(){
        Highcharts.chart('container', {
            chart: {
                type: 'spline'
            },
            title: {
                text: 'Monthly Average Temperature'
            },
            subtitle: {
                text: 'Source: ' +
                    '<a href="https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature" ' +
                    'target="_blank">Wikipedia.com</a>'
            },
            xAxis: {
                categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                accessibility: {
                    description: 'Months of the year'
                }
            },
            yAxis: {
                title: {
                    text: 'Temperature'
                },
                labels: {
                    formatter: function () {
                        return this.value + '°';
                    }
                }
            },
            tooltip: {
                crosshairs: true,
                shared: true
            },
            plotOptions: {
                spline: {
                    marker: {
                        radius: 4,
                        lineColor: '#666666',
                        lineWidth: 1
                    }
                }
            },
            /* 데이터는 배열로 되어 있음. 배열 안에 json */
            series: [{
                name: 'Tokyo',
                marker: {
                    symbol: 'square'
                },
                data: [5.2, 5.7, 8.7, 13.9, 18.2, 21.4, 25.0, 26, 22.8, 17.5, 12.1, 7.6]

            }, {
                name: 'Bergen',
                marker: {
                    symbol: 'diamond'
                },
                data: [1.0, 1.6, 3.3, 5.9, 10.5, 13.5, 14.5, 14.4, 11.5, 8.7, 4.7, 2.6]
            }]
        });
    }
};
// 문서가 준비되면~
$(function(){
    chart01.init();
})