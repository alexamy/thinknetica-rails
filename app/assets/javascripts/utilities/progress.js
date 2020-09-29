document.addEventListener('turbolinks:load', function() {
  const progressBar = document.querySelector('.progress-bar');
  if(progressBar) {
    const { progress, total } = progressBar.dataset;
    progressBar.style.width = `${progress / total * 100}%`;
  }
});
