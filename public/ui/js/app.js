'use strict'

const months = {
    '01': 'Jan','02': 'Fev','03': 'Mar','04': 'Abr','05': 'Mai','06': 'Jun',
    '07': 'Jul','08': 'Ago','09': 'Set','10': 'Out','11': 'Nov','12': 'Dez',
};

const viewData = {
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
const hardCodedReddits = apiToFunnel(viewData);
var graph = new FunnelGraph({
    container: '.funnel',
    gradientDirection: 'horizontal',
    data: hardCodedReddits,
    displayPercent: false,
    direction: 'horizontal',
    width: 800,
    height: 300,
    subLabelValue: 'raw'
});

graph.draw();

const buildGraph = (response) => {
    const viewData = {};
    Object.keys(response.totals).sort().forEach((k) => {
        const yearMonth = k.split('_');
        const year = yearMonth[0];
        const month = yearMonth[1];
        viewData[`${months[month]}/${year}`] = response.totals[k];
    });
    document.getElementById('last_updated').innerHTML = 'last updated: ' + response.last_updated;

    const reddits = apiToFunnel(viewData);
    if (reddits) {
        graph.updateData(reddits);
    }
};

document.getElementById('last_updated').innerHTML = 'wait for about 10s..';

setTimeout(() => {
    setInterval(() => { apiBridge.redditData(buildGraph); }, 10000);
}, 5000);