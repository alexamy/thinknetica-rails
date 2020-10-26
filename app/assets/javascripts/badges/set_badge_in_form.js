document.addEventListener('turbolinks:load', function() {
  const icon = document.querySelector('#badge_icon');
  const select = document.querySelector('#badge_filename');
  if(icon && select) {
    setupIconChange(icon, select);
  }
});

function setupIconChange(icon, select) {
  const setIcon = () => {
    const selected = select.options[select.selectedIndex];
    icon.style.backgroundImage = `url(${selected.dataset.imagePath})`;
  }

  setIcon();
  select.addEventListener('change', setIcon);
}
