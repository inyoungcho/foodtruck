App.TruckController = Ember.ObjectController.extend({
  selectedSlot: null,

  actions: {
    selectSlot: function(slot) {
      this.set('selectedSlot', slot);
    }
  }
  
});