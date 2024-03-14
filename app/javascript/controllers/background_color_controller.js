import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="background-color"
export default class extends Controller {
  connect() {
    const currentRoute = this.element.dataset.currentRoute;

    if (currentRoute.includes('verdict')) {
      this.element.style.backgroundColor = "#DAFF35";
    } else if (currentRoute.includes('preselected_bars') && !currentRoute.includes('new')){
      this.element.style.backgroundColor = "rgb(166, 77, 255)";
    }
  }
}
