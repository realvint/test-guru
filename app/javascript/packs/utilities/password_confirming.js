document.addEventListener('turbolinks:load', () => {
  const confirm_field = document.querySelector('#user_password_confirmation')

  if (confirm_field == null)
    return
  else {
    const wrongConfirmation = document.querySelector(".octicon-alert")
    const successConfirmation = document.querySelector(".octicon-check")

    confirm_field.addEventListener('change', event => {
      const confirm = event.target.value
      const password = document.querySelector('#user_password').value
      if (confirm === password) {
        successConfirmation.classList.remove('hide')
        wrongConfirmation.classList.add('hide')
      }
      else {
        successConfirmation.classList.add('hide')
        wrongConfirmation.classList.remove('hide')
      }
    })
  }
})