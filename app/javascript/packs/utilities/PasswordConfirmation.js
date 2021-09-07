export class PasswordConfirmation {
  constructor(form) {
    this.form = form
    this.password = form.elements.user_password
    this.password_confirm = form.elements.user_password_confirmation
    this.wrongConfirmation = form.querySelector(".octicon-alert")
    this.successConfirmation = form.querySelector(".octicon-check")
    this.setup()
  }
  setup() {
    this.form.addEventListener('keyup', event => {
      if (this.password_confirm.value) { this.checkPasswords() }
      else this.resetStyle()
    })
  }

  checkPasswords() {
    if (this.password.value === this.password_confirm.value) {
      this.successConfirmation.classList.remove('hide')
      this.wrongConfirmation.classList.add('hide')
    } else {
      this.successConfirmation.classList.add('hide')
      this.wrongConfirmation.classList.remove('hide')
    }
  }

  resetStyle() {
    this.wrongConfirmation.classList.add('hide')
    this.successConfirmation.classList.add('hide')
  }
}
