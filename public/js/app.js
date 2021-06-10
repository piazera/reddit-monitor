'use strict'

var graph = new FunnelGraph({
    color: ['orange', 'red'],
    container: '.funnel',
    gradientDirection: 'horizontal',
    data: {
        labels: ['Impressions', 'Add To Cart', 'Buy'],
        colors: ['orange', 'red'],
        values: [12000, 5700, 360]
    },
    displayPercent: true,
    direction: 'horizontal'
});


graph.draw();

console.log('running.');