App.TruckRoute = Ember.Route.extend({

  setupController: function(controller, model) {
    controller.set('content', model);
  },

  model: function(params) {
    var truck = this.store.find('truck', params.truck_id);
    return truck;
  },

  enter: function(route) {
    window.scrollTo(0, 0);
  }

});