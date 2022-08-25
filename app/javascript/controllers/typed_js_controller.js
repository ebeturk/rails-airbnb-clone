import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Tame your dragon of choice and change your life.", "Book a beast now!"],
      typeSpeed: 30,
      loop: true
    })
  }
}
