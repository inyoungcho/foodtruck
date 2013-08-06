App.SlotsRoute = Ember.Route.extend({
  observesParameters: ['kind', 'weekday', 'neighborhood'],

  setupController: function(controller, model) {
    controller.set('content', model);

    $.get('/slots/available_filters', function(data) {
      controller.set('availableWeekdays', data['weekdays']);
      controller.set('availableNeighborhoods', data['neighborhoods']);
      controller.set('availableKinds', data['kinds']);
    });
  },

  model: function() {
    return App.Slot.find(this.get('queryParameters'));
  },

  events: {
    filtersDidChange: function() {
      var params = Ember.Router.QueryParameters.create({
        weekday: this.get('controller').get('weekday'),
        neighborhood: this.get('controller').get('neighborhood'),
        kind: this.get('controller').get('kind')
      });
      this.transitionTo('slots', params);
    }  
  }
});
