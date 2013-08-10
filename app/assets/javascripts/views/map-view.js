var fitBoundsAndKeepZoom = function(map, bounds) {
  map.fitBounds(bounds);
  // this seems so stupid
  google.maps.event.addListenerOnce(map, 'bounds_changed', function(e) {
    if(this.getZoom() > 16) {
      this.setZoom(16);      
    }
  });
}

// Google Maps Geocoding HATES landmarks more than anything else,
// but they're still nice to show in the list presented to the user,
// so they're just stripped for geocoding
var removeLandmarks = function(address) {
  addressParts = address.split(",");
  return addressParts[0]; // ugh
}

var mapSlot = function(slot, map, geocoder, bounds) {
  var address = removeLandmarks(slot.get('address')) + ", Seattle, WA, USA";
  geocoder.geocode( { 'address': address }, function(results, status) {
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
    this.initializeMap();
    // Map just the selected slot now
    var slot = this.get('controller').get('selectedSlot');
    mapSlot(slot, this.get('map'), this.get('geocoder'), this.get('bounds'));
  }.observes('selectedSlot')

});