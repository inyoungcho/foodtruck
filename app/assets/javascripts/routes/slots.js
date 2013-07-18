App.SlotsRoute = Ember.Route.extend({
  model: function() {
    return App.Slot.find();
  }
});