import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image-swiper"
export default class extends Controller {
  connect() {
    console.log("All in!");
    // this.swiper = new Swiper('.swiper-container', {
    //   // Swiper configuration options
    //   nextEl: ".swiper-button-next",
    //   prevEl: ".swiper-button-prev",
    // });
  }
}
