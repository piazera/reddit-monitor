const apiToFunnel = require('../js/api-to-funnel');
const should = require('should');

describe('Array', function() {
  describe('#indexOf()', function() {
    it('should convert api format to funnel graph format', function() {
      const fakeData = {
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
            'Mandetta': 430
        }
      };
      const funnelData = apiToFunnel(fakeData);
      funnelData.should.have.property('labels');
      funnelData.labels.should.containDeepOrdered(['Abril', 'Maio', 'Junho']);

      funnelData.should.have.property('subLabels');
      funnelData.subLabels.should.containDeepOrdered(['Bolsonaro', 'Lula', 'Mandetta']);

      funnelData.should.have.property('values');
      funnelData.values.should.containDeepOrdered([
        [3500, 2500, 500],
        [3300, 3000, 300],
        [3300, 3100, 430]
      ]);
    });
  });
});