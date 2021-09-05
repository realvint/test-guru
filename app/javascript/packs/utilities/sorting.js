document.addEventListener('turbolinks:load',  () => {
  const control = document.querySelector('.sort-by-title')

  if (control) control.addEventListener('click', sortRowsByTitle)
})

const sortRowsByTitle = () => {
  const table = document.querySelector('.table');
  const sortedRows = Array.from(table.rows).slice(1);
  const arrowUp = document.querySelector('.octicon-arrow-up');
  const arrowDown = document.querySelector('.octicon-arrow-down');

  if (arrowUp.classList.contains('hide')) {
    sortedRows.sort((rowA, rowB) => rowA.cells[0].innerHTML > rowB.cells[0].innerHTML ? 1 : -1);
    arrowUp.classList.remove('hide');
    arrowDown.classList.add('hide');
  } else {
    sortedRows.sort((rowA, rowB) => rowA.cells[0].innerHTML > rowB.cells[0].innerHTML ? -1 : 1);
    arrowUp.classList.add('hide');
    arrowDown.classList.remove('hide');
  }

  table.tBodies[0].append(...sortedRows);
}
