import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-project-description"
export default class extends Controller {
  connect() {
    console.log('im coneccted');
  }

  initialize() {
    this.element.setAttribute('data-action', 'click->edit-project-description#showModal')
  }

  showModal(event){
    event.preventDefault();
    this.url = this.element.getAttribute('href')
    fetch(this.url, {
      headers: {
        Accept: "text/vnd.turbo_stream.html, text/html, application/xhtml+xml"
      }
    })
    .then(response => response.text())
    .then(html => Turbo.renderStreamMessage(html))
  }
}
