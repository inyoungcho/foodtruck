var mapSlot = function(slot, map, geocoder) {
  geocoder.geocode( { 'address': slot.get('address') + ", Seattle, WA" }, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      var point = results[0].geometry.location;
      var marker = new google.maps.Marker({
          map: map,
          position: point
      });
      return point;
    }
  });
}

var mapAllSlots = function(slots, map, geocoder) {
  var overallBounds = new google.maps.LatLngBounds();

  slots.forEach(function(slot) {
    overallBounds.extend(mapSlot(slot, map, geocoder));
  });

  map.fitBounds(overallBounds);
}

App.TruckMapView = Ember.View.extend({
  classNames: ['map-canvas'],
  map: null,
  geocoder: null,
  // Map all slots by default
  didInsertElement: function() {
    var mapOptions = {
      center: new google.maps.LatLng(-34.397, 150.644),
      zoom: 16,
      disableDefaultUI: true,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(this.$().get(0), mapOptions);
    var geocoder = new google.maps.Geocoder();
    this.set('map', map);
    this.set('geocoder', geocoder);
    var slots = this.get('controller').get('model').get('slots');
    mapAllSlots(slots, map, geocoder);
  },
  reRenderMap: function() {

  }
});