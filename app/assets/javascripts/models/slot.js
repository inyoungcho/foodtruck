App.Slot = DS.Model.extend({
  weekday: DS.attr('string'),
  address: DS.attr('string'),
  neighborhood: DS.attr('string'),
  period: DS.attr('string'),

  truck: DS.belongsTo('App.Truck')
});

// App.Slot.FIXTURES = [
// { "id":2,"truck_id":2,weekday:"Wednesday","address":"2121 6th Ave","neighborhood":"South Lake Union","period":"11AM-1PM","created_at":"2013-07-18T04:55:56.765Z","updated_at":"2013-07-18T04:55:56.765Z" }
// ];