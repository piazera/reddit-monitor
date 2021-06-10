'use strict'

const apiToFunnel = (input) => {
    let result = { labels: [], subLabels: [], values: [] };
    let terms = void 0;
    const months = Object.keys(input);
    for (let i=0; i<months.length; i++) {
        const monthName = months[i];
        result.labels.push(monthName);
        const month = input[monthName];
        const dataKeys = Object.keys(month);
        if (terms === void 0) {
            result.subLabels = dataKeys;
        }
        let values = [];
        for (let j=0; j<dataKeys.length; j++) {
            const value = month[dataKeys[j]];
            values.push(value);
        }
        result.values.push(values);
    }
    return result;
}

if (typeof module !== 'undefined' && typeof module.exports !== 'undefined') {
    module.exports = apiToFunnel;
}