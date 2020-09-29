document.addEventListener('turbolinks:load', function() {
  const controls = document.querySelectorAll('.form-inline-link');
  controls.forEach(control => control.addEventListener('click', formInlineLinkHandler));
});

function formInlineLinkHandler(event) {
  event.preventDefault();

  const testId = this.dataset.testId;
  console.log(testId);
}
