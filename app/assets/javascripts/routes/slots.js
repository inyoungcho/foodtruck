App.SlotsRoute = Ember.Route.extend({
  observesParameters: ['kind', 'weekday', 'neighborhood'],
  model: function() {
    return App.Slot.find(this.get('queryParameters'));
  }
});