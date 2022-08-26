import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }


  connect() {
    console.log(this.apiKeyValue)
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/light-v10"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const customMarker = document.createElement('div')
      customMarker.className = "marker"
      customMarker.style.height = "30px"
      customMarker.style.width = "30px"
      customMarker.style.backgroundSize = "cover"
      customMarker.style.backgroundImage = `url('${ marker.image_url }')`

      const popup = new mapboxgl.Popup().setHTML(marker.info_window) // Add this
      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup) // Add this
        .addTo(this.map)
    });
  }
}
