document.addEventListener('turbolinks:load',  () => {

  const progressBar = document.getElementById('progress_bar')

  if (progressBar) { updateBar() }
})

  const updateBar = () => {
    const progressBarValue = document.querySelector('.progress-bar-value')
    const currentQuestionId = progressBarValue.dataset.currentQuestionId
    const questionsCount = progressBarValue.dataset.questionsCount
    const progress = document.querySelector('.progress-bar')
    const Width = ((currentQuestionId - 1) / questionsCount) * 100

    progress.style.width = '' + Width + '%'
    progressBarValue.textContent = '' + Width + '%'
  }
