document.addEventListener('turbolinks:load', function() {
  const controls = document.querySelectorAll('.form-inline-link');
  controls.forEach(control => control.addEventListener('click', formInlineLinkHandler));

  const errors = document.querySelector('.resource-errors');
  if(controls.length && errors) {
    const resourceId = errors.dataset.resourceId;
    formInlineHandler(resourceId);
  }
});

function formInlineLinkHandler(event) {
  event.preventDefault();

  const testId = this.dataset.testId;
  formInlineHandler(testId);
}

function formInlineHandler(testId) {
  const testDataAttr = `[data-test-id="${testId}"]`;
  const link = document.querySelector('.form-inline-link' + testDataAttr);
  const testTitle = document.querySelector('.test-title' + testDataAttr);
  const formInline = document.querySelector('.form-inline' + testDataAttr);

  if(formInline.classList.contains('hide')) {
    testTitle.classList.add('hide')
    formInline.classList.remove('hide')
    link.textContent = link.dataset.cancelLabel;
  }
  else {
    testTitle.classList.remove('hide')
    formInline.classList.add('hide')
    link.textContent = link.dataset.editLabel;
  }
}
