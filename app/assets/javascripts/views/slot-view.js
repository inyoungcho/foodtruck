App.SlotView = Ember.View.extend({
  templateName: 'truck-slot',
  selectedSlotBinding: 'controller.selectedSlot',

  isSelected: function() {
    return (this.get('content') == this.get('controller').get('selectedSlot'));
  }.property('selectedSlot')

});