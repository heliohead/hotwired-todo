import { Controller } from "@hotwired/stimulus"
import { get, patch } from "@rails/request.js"

export default class extends Controller {
  static targets = ["select"]
  static values = {
    url: String,
    param: String
  }


  change(event) {
    let user_id = event.target.selectedOptions[0].value

    get(`${this.urlValue}?user_id=${user_id}`, { responseKind: "turbo-stream" })
  }

  toggle(event) {
    let todo_id = event.target.dataset.todo
    let status = event.target.dataset.status

    patch(`/todos/${todo_id}`, {
      responseKind: "turbo-stream",
      body: JSON.stringify({ todo: { status: status } })
    })
  }
}
