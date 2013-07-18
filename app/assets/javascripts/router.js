App.Router.map(function() {
  this.resource('slots');
  this.resource('trucks');
  this.resource('truck', { path: '/trucks/:truck_id' });
});
