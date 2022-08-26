import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }


  connect() {
    console.log(this.apiKeyValue)
    mapboxgl.accessToken = this.apiKeyValue
<<<<<<< HEAD
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
=======
>>>>>>> master

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

<<<<<<< HEAD
=======
    // #addMarkersToMap() {
    //   this.markersValue.forEach((marker) => {
    //     new mapboxgl.Marker()
    //       .setLngLat([ marker.lng, marker.lat ])
    //       .addTo(this.map)
    //   })
    // }

    // #fitMapToMarkers() {
    //   const bounds = new mapboxgl.LngLatBounds()
    //   this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    //   this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
    // }

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
>>>>>>> master
  }
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
<<<<<<< HEAD
=======

>>>>>>> master
  }
}
