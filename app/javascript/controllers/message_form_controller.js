import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="messege-form"
export default class extends Controller {
  static targets = ["messageDate"]
  connect() {
    console.log(this.messageDateTarget)
  }
  displayDate(e){
    console.log(e.target.value)
    if (e.target.value === 'Message') {
      this.messageDateTarget.classList.remove("d-none")
    } else {
      this.messageDateTarget.classList.add("d-none")
    }
  }
}
