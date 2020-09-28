document.addEventListener('turbolinks:load', function() {
  const control = document.querySelector('.sort-by-label');
  if(control) { control.addEventListener('click', sortRowsByLabel); }
});

function sortRowsByLabel() {
  const table = document.querySelector('table');
  const rows = table.querySelectorAll('tr');

  const sortedRows = [];
  for(let i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i]);
  }

  var arrowUp = this.querySelector('.bi-arrow-up-short');
  var arrowDown = this.querySelector('.bi-arrow-down-short');

  if(arrowUp.classList.contains('hide')) {
    arrowUp.classList.remove('hide');
    arrowDown.classList.add('hide');
    sortedRows.sort(compareRowsAsc);
  }
  else {
    arrowUp.classList.add('hide');
    arrowDown.classList.remove('hide');
    sortedRows.sort(compareRowsDesc);
  }

  const sortedTable = document.createElement('table');
  sortedTable.className = table.className;
  sortedTable.appendChild(rows[0]);

  sortedRows.forEach(row => sortedTable.appendChild(row));
  table.parentNode.replaceChild(sortedTable, table);
}

function compareRowsAsc(row1, row2) {
  const textTitle1 = row1.querySelector('td').textContent;
  const textTitle2 = row2.querySelector('td').textContent;

  if(textTitle1 < textTitle2) { return -1; }
  if(textTitle1 > textTitle2) { return 1; }
  return 0;
}

function compareRowsDesc(row1, row2) {
  return compareRowsAsc(row2, row1);
}
