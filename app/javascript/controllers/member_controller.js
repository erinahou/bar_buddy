import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="member"
export default class extends Controller {
  static targets = ["emailInput", "emailList"];

  connect() {
    console.log("Hello from the member controller!");
  }

  add(event) {
    event.preventDefault();
    // const form = event.currentTarget;
    // // console.log(fetch(form.action));
    const email = this.emailInputTarget.value;
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
    const form = document.querySelector("form");

    const requestDetails = {
      method: "POST",
      headers: {"Content-Type": "application/json",
      "X-CSRF-Token": csrfToken},
      body: JSON.stringify({"email": email}),
    };

    console.log(event);
    console.log(email);

    fetch(event.target.action, requestDetails) // Complete the fetch call by providing the URL and request details
    .then(response => {
      console.log('response: ', response)
      if (!response.ok) {
      throw new Error('Network response was not ok');
      };
      return response.json();
    })
    .then(data => {
      console.log('Member created:', data);
      if (data.status == "success") {
        this.emailListTarget.insertAdjacentHTML("beforeend", `<li>${data.user.first_name} ${data.user.last_name}</li>`);
      };
    })
    .catch(error => {
      console.error('There was a problem with the fetch operation:', error);
    });
  }
}
