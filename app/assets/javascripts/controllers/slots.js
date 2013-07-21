App.SlotsController = Ember.ArrayController.extend({
  weekday: null,
  kind: null,
  neighborhood: null,

  availableWeekdays: null,
  availableNeighborhoods: null,
  availableKinds: null,

  filtersChanged: function() {
    this.send('filtersDidChange');
  }.observes('weekday', 'kind', 'neighborhood')
});
