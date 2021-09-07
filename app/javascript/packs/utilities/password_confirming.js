import { PasswordConfirmation } from './PasswordConfirmation.js'

document.addEventListener('turbolinks:load', () => {
  const form = document.getElementById('new_user')
  if(form) new PasswordConfirmation(form)
})
