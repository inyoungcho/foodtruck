App.Slot = DS.Model.extend({
  weekday: DS.attr('string'),
  address: DS.attr('string'),
  neighborhood: DS.attr('string'),
  period: DS.attr('string'),

  truck: DS.belongsTo('App.Truck')
});
