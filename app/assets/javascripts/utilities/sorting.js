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
  sortedRows.sort(compareRows);

  const sortedTable = document.createElement('table');
  sortedTable.className = table.className;
  sortedTable.appendChild(rows[0]);

  sortedRows.forEach(row => sortedTable.appendChild(row));
  table.parentNode.replaceChild(sortedTable, table);
}

function compareRows(row1, row2) {
  const textTitle1 = row1.querySelector('td').textContent;
  const textTitle2 = row2.querySelector('td').textContent;

  if(textTitle1 < textTitle2) { return -1; }
  if(textTitle1 > textTitle2) { return 1; }
  return 0;
}
