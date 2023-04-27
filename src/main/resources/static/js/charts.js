

let chart1 = {
    init   : function () {
        /* this를 고정 */
        const self = this;
        self.getData(self)
    },
    getData: function (self) {
        $.ajax({
            url    : '/app_user_statics',
            success: function (result) {
                self.display(result);
            }
        });
    },
    display: function (result) {
        Highcharts.chart('container', {
            chart      : {
                type     : 'column',
                options3d: {
                    enabled: true,
                    alpha  : 10,
                    beta   : 25,
                    depth  : 70
                }
            },
            title      : {
                text : '주요 은행 뱅킹 서비스 관련 앱 11월 사용자 수 현황, 2020',
                align: 'left'
            },
            subtitle   : {
                text : 'Source: ' +
                    '<a href="https://platum.kr/archives/154943"' +
                    'target="_blank">아이지에이웍스</a>',
                align: 'left'
            },
            plotOptions: {
                column: {
                    depth: 25
                }
            },
            xAxis      : {
                categories: result.category,
                labels    : {
                    skew3d: true,
                    style : {
                        fontSize: '16px'
                    }
                }
            },
            yAxis      : {
                title: {
                    text  : '',
                    margin: 20
                }
            },
            tooltip    : {
                valueSuffix: ''
            },
            series     : [{
                name: 'Total users',
                data: result.data
            }]
        });
    }
};

let chart2 = {
    init   : function () {
        /* this를 고정 */
        const self = this;
        self.getData(self)
    },
    getData: function (self) {
        $.ajax({
            url: '/app_user_age',
            success: function(result){
                // console.log(result);
                self.display(result);
            }
        });
    },
    display: function (result) {
        Highcharts.chart('container2', {
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: '뱅킹 앱 사용자 연령별 통계, 2020',
                align: 'left'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            accessibility: {
                point: {
                    valueSuffix: '%'
                }
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                    }
                }
            },
            series: [{
                name: 'Age',
                colorByPoint: true,
                // data: [{
                //     name: 'Chrome',
                //     y: 70.67,
                // }, {
                //     name: 'Edge',
                //     y: 14.77
                // }]
                data : result
            }]
        });
    }

};

let chart3 = {
    init   : function () {
        /* this를 고정 */
        const self = this;
        self.getData(self)
    },
    getData: function (self) {
        $.ajax({
            url    : '/baseRate',
            success: function (result) {
                console.log(result);
                self.display(result);
            }
        });
    },
    display: function (result) {
        Highcharts.chart('container3', {
            chart: {
                type: 'spline'
            },
            title: {
                text: '한미 기준금리 추이, 2022년'
            },
            subtitle: {
                text: 'Source: ' +
                    '<a href="https://elonbro.tistory.com/entry/%EA%B8%B0%EC%A4%80%EA%B8%88%EB%A6%AC-%ED%95%9C%EA%B5%AD-%EB%AF%B8%EA%B5%AD-%EA%B8%B0%EC%A4%80-%EA%B8%88%EB%A6%AC-%EB%B9%84%EA%B5%90" ' +
                    'target="_blank">한미기준금리차이</a>'
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
                    text: 'Base rate'
                },
                labels: {
                    formatter: function () {
                        return this.value + '%';
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
            // series: [{
            //   name: 'Tokyo',
            //   marker: {
            //     symbol: 'square'
            //   },
            //   data: [5.2, 5.7, 8.7, 13.9, 18.2, 21.4, 25.0, {
            //     y: 26.4,
            //     marker: {
            //       symbol: 'url(https://www.highcharts.com/samples/graphics/sun.png)'
            //     },
            //     accessibility: {
            //       description: 'Sunny symbol, this is the warmest point in the chart.'
            //     }
            //   }, 22.8, 17.5, 12.1, 7.6]
            //
            // }, {
            //   name: 'Bergen',
            //   marker: {
            //     symbol: 'diamond'
            //   },
            //   data: [{
            //     y: 1.5,
            //     marker: {
            //       symbol: 'url(https://www.highcharts.com/samples/graphics/snow.png)'
            //     },
            //     accessibility: {
            //       description: 'Snowy symbol, this is the coldest point in the chart.'
            //     }
            //   }, 1.6, 3.3, 5.9, 10.5, 13.5, 14.5, 14.4, 11.5, 8.7, 4.7, 2.6]
            // }]
            series : result
        });

    }
}