App.TruckRoute = Ember.Route.extend({

  setupController: function(controller, model) {
    controller.set('content', model);
  },

  model: function(params) {
    return App.Truck.find(params.truck_id);
  },

  enter: function(route) {
    window.scrollTo(0, 0);
  }

});