// This is my least favourite code anywhere ever
Ember.Handlebars.helper("currentWeekday", function() {
  var weekday = new Array(7);
  weekday[0]="Sunday";
  weekday[1]="Monday";
  weekday[2]="Tuesday";
  weekday[3]="Wednesday";
  weekday[4]="Thursday";
  weekday[5]="Friday";
  weekday[6]="Saturday";

  return weekday[(new Date()).getDay()];
});
