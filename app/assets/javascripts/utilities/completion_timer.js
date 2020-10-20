document.addEventListener('turbolinks:load', function() {
  const timers = [...document.querySelectorAll('.timer-elapsed')];
  timers.forEach(node => setTimer(node));
});

function setTimer(node) {
  let elapsedTime = node.dataset.startTime;

  const updateTime = () => {
    node.textContent = toMinutesSecond(elapsedTime);
    elapsedTime -= 1;

    if(elapsedTime <= -5) { // better sync with backend than 0
      location.reload();
    }
  }

  updateTime();
  setInterval(updateTime, 1000);
}

function toMinutesSecond(secondsFull) {
  secondsFull = secondsFull < 0 ? 0 : secondsFull;

  let minutes = Math.floor(secondsFull / 60);
  let seconds = secondsFull - minutes * 60;

  minutes = minutes < 10 ? `0${minutes}` : minutes;
  seconds = seconds < 10 ? `0${seconds}` : seconds;

  return `${minutes}:${seconds}`;
}
