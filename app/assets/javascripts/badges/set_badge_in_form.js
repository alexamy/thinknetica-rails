document.addEventListener('turbolinks:load', function() {
  const form = document.querySelector('#badge_form');
  if(form) {
    setIconChange(form);
    setRuleSelect(form);
  }
});

function getSelected(select) {
  return select.options[select.selectedIndex];
}

function setIconChange(form) {
  const icon = form.querySelector('#badge_icon');
  const select = form.querySelector('#badge_filename');

  const setIcon = () => {
    const selected = getSelected(select);
    icon.style.backgroundImage = `url(${selected.dataset.imagePath})`;
  }

  setIcon();
  select.addEventListener('change', setIcon);
}

function setRuleSelect(form) {
  const ruleSelect = form.querySelector('#badge_rule');
  const conditions = {
    level: form.querySelector('#group_level'),
    category: form.querySelector('#group_category'),
    first_try: form.querySelector('#group_first_try')
  };

  const updateConditions = () => {
    for(const rule in conditions) {
      conditions[rule].classList.add('d-none');
      conditions[rule].querySelector('.form-control').disabled = true;
    }

    const selected = conditions[getSelected(ruleSelect).value];
    selected.classList.remove('d-none');
    selected.querySelector('.form-control').disabled = false;
  }

  updateConditions();
  ruleSelect.addEventListener('change', updateConditions);
}
