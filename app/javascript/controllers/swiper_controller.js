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

  getPreselectedBarId(slideIndex) {
    const slideElement = this.swiper.slides[slideIndex];
    return slideElement.dataset.preselectedBarId;
  }

  swipeNext(event) {
    const voteValue = event.currentTarget.getAttribute('data-swiper-vote-value');
    console.log('Vote value:', voteValue);

    const currentSlide = this.swiper.activeIndex;
    const preselectedBarId = this.getPreselectedBarId(currentSlide);


    this.element.dataset[`vote_${preselectedBarId}`] = voteValue;

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
    const form = this.element;


    const voteData = {};
    this.swiper.slides.forEach((slide, index) => {
      const preselectedBarId = this.getPreselectedBarId(index);
      const voteValue = form.dataset[`vote_${preselectedBarId}`];
      voteData[preselectedBarId] = voteValue;
    });

    console.log('Vote data:', voteData);


    fetch(form.action, {
      method: form.method,
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify({ votes: voteData })
    })
    .then(response => {
      if (response.ok) {
        window.location.href = response.url;
      } else {
        console.error('Failed to record votes');
      }
    })
    .catch(error => {
      console.error('Error:', error);
    });
  }
}
