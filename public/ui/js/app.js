'use strict'

const months = {
    '01': 'Jan','02': 'Fev','03': 'Mar','04': 'Abr','05': 'Mai','06': 'Jun',
    '07': 'Jul','08': 'Ago','09': 'Set','10': 'Out','11': 'Nov','12': 'Dez',
};

let firstDraw = true;

let graph;

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
        if (firstDraw) {
            firstDraw = false;
            graph = new FunnelGraph({
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
        } else {
            graph.updateData(reddits);
        }
    }
};

document.getElementById('last_updated').innerHTML = 'hold on for some seconds..';

setInterval(() => { apiBridge.redditData(buildGraph); }, 5000);