'use strict'

//const apiBridge = require('./api-bridge');
//const apiToFunnel = require('./api-to-funnel');

//const apiData = apiBridge.redditData();
const apiData = {
    'Abril': {
        'Bolsonaro': 3500,
        'Lula': 2500,
        'Mandetta': 500
    },
    'Maio': {
        'Bolsonaro': 3300,
        'Lula': 3000,
        'Mandetta': 300
    },
    'Junho': {
        'Bolsonaro': 3300,
        'Lula': 3100,
        'Mandetta': 2430
    }
};
const reddits = apiToFunnel(apiData);

var graph = new FunnelGraph({
    container: '.funnel',
    gradientDirection: 'horizontal',
    data: reddits,
    displayPercent: false,
    direction: 'horizontal',
    width: 800,
    height: 300,
    subLabelValue: 'raw'
});

graph.draw();