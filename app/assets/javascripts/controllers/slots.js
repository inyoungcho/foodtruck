var defaultWeekdayValue = function() {
  var weekday = new Array(7);
  weekday[0]="Sunday";
  weekday[1]="Monday";
  weekday[2]="Tuesday";
  weekday[3]="Wednesday";
  weekday[4]="Thursday";
  weekday[5]="Friday";
  weekday[6]="Saturday";

  return weekday[(new Date()).getDay()];
}

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
