App.SlotsController = Ember.ArrayController.extend({
  weekday: defaultWeekdayValue(),
  kind: null,
  neighborhood: null,

  availableWeekdays: null,
  availableNeighborhoods: null,
  availableKinds: null,

  filtersChanged: function() {
    this.send('filtersDidChange');
  }.observes('weekday', 'kind', 'neighborhood')
});
