import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="background-color"
export default class extends Controller {
  connect() {
    const currentRoute = this.element.dataset.currentRoute;

    if (currentRoute.includes('verdict')) {
      this.element.style.backgroundColor = "#DAFF35";

    }
  }
}
