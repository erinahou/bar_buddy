// app/javascript/controllers/swiper_controller.js
import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  connect() {
    this.swiper = new Swiper('.swiper-container', {
      // Swiper configuration options
      effect: "cards",
      grabCursor: true,
      allowTouchMove: false, // Disable direct swiping by user
    });
  }

  swipeNext(event) {
    if (this.isLastSlide()) {
      this.submitForm();
    } else {
      this.swiper.slideNext();
    }
  }

  isLastSlide() {
    return this.swiper.isEnd;
  }

  submitForm() {
    const form = this.element; // Access the form element
    form.submit(); // Submit the form
  }
}
