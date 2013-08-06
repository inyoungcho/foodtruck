var fitBoundsAndKeepZoom = function(map, bounds) {
  map.fitBounds(bounds);
  // this seems so stupid
  google.maps.event.addListenerOnce(map, 'bounds_changed', function(e) {
    this.setZoom(16);
  });
}

var mapSlot = function(slot, map, geocoder, bounds) {
  geocoder.geocode( { 'address': slot.get('address') + ", Seattle, WA" }, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      var point = results[0].geometry.location;
      var marker = new google.maps.Marker({
          map: map,
          position: point
      });

      // Update the bounds as a new slot is mapped
      bounds.extend(point);
      fitBoundsAndKeepZoom(map, bounds);
    }
  });
}

var mapAllSlots = function(slots, map, geocoder, bounds) {
  slots.forEach(function(slot) {
    mapSlot(slot, map, geocoder, bounds);
  });
}

App.TruckMapView = Ember.View.extend({
  classNames: ['map-canvas'],
  map: null,
  geocoder: null,
  bounds: null,
  selectedSlotBinding: 'controller.selectedSlot',

  initializeMap: function() {
    var mapOptions = {
      disableDefaultUI: true,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var map = new google.maps.Map(this.$().get(0), mapOptions);
    var geocoder = new google.maps.Geocoder();
    var bounds = new google.maps.LatLngBounds();

    this.set('map', map);
    this.set('geocoder', geocoder);
    this.set('bounds', bounds);
  },

  didInsertElement: function() {
    this.initializeMap();
    // Map all slots by default
    var slots = this.get('controller').get('model').get('slots');
    mapAllSlots(slots, this.get('map'), this.get('geocoder'), this.get('bounds'));
  },
  
  reRenderMap: function() {
    alert("rerendering");
  }.observes('selectedSlot')
});