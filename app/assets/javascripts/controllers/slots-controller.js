App.SlotsController = Ember.ArrayController.extend({
  weekday: defaultWeekdayValue(),
  kind: null,
  neighborhood: null,

  availableWeekdays: null,
  availableNeighborhoods: null,
  availableKinds: null,

  filteredSlots: function() {
    var slots = this.get('content');

    var refineResults = function(results, name, desired) {
      if(desired !== null) {
        return results.filterProperty(name, desired);
      }
      return results;
    };

    slots = refineResults(slots, 'weekday', this.get('weekday'));
    slots = refineResults(slots, 'truck.kind', this.get('kind'));
    slots = refineResults(slots, 'neighborhood', this.get('neighborhood'));

    return slots;
  }.property('content.@each', 'weekday', 'kind', 'neighborhood')
  
});
