App.TruckRoute = Ember.Route.extend({

  model: function(params) {
    return App.Truck.find(params.truck_id);
  }

});