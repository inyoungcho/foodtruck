App.IndexRoute = Ember.Route.extend({
  setupController: function(controller) {
    controller.transitionToRoute('slots');
  }
});