App.SlotsRoute = Ember.Route.extend({

  setupController: function(controller, model) {
    controller.set('content', model);

    $.get('/slots/available_filters', function(data) {
      controller.set('availableWeekdays', data['weekdays']);
      controller.set('availableNeighborhoods', data['neighborhoods']);
      controller.set('availableKinds', data['kinds']);
    });
  },

  model: function() {
    return App.Slot.find();
  }

});
