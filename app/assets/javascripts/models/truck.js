App.Truck = DS.Model.extend({
  name: DS.attr('string'),
  kind: DS.attr('string'),
  description: DS.attr('string'),
  twitter: DS.attr('string'),
  facebook: DS.attr('string'),
  website: DS.attr('string'),
  acceptsCards: DS.attr('boolean'),

  slots: DS.hasMany('slot')
});