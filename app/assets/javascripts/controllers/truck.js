App.TruckController = Ember.ObjectController.extend({
  selectedSlot: null,

  selectSlot: function(slot) {
    this.set('selectedSlot', slot);
  }

});