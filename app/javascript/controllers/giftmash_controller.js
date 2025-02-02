import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["loader"];

  connect() {
    console.log("GiftmashController connected!"); 

    document.getElementById("gifts-loader").style.display = "none";
    document.getElementById("overlay").style.display = "none";
  }

  showLoader(event) {
    console.log("Like button clicked!");
    event.preventDefault();

    document.getElementById("gifts-loader").style.display = "block";
    document.getElementById("overlay").style.display = "block";

    setTimeout(() => {
      event.target.form.submit();
    }, 2000);
  }
}