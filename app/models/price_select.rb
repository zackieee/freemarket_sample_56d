class PriceSelect < ActiveHash::Base
  self.data = [
    {id: 0, name: ''}, {id: 1, name: '300~1000', min: '300', max: '10000'},
    {id: 2, name: '1000~5000', min: '1000', max: '5000'}, {id: 3, name: '5000~10000', min: '5000', max: '10000'},
    {id: 4, name: '10000~30000', min: '10000', max: '30000'}, {id: 5, name: '30000~50000', min: '30000', max: '50000'}, 
    {id: 6, name: '50000~', min: '50000'}
  ]
end