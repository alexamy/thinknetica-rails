document.addEventListener('turbolinks:load', function() {
  const form = document.querySelector('form#new_user');
  if(!form) return;

  const password = form.querySelector('#user_password');
  const passwordConfirmation = form.querySelector('#user_password_confirmation');

  const check = () => checkPasswordConfirmation(password, passwordConfirmation);
  if(password) {
    password.addEventListener('input', check);
    password.addEventListener('change', check);
    password.addEventListener('paste', check);
  }

  if(passwordConfirmation) {
    passwordConfirmation.addEventListener('input', check);
    passwordConfirmation.addEventListener('change', check);
    passwordConfirmation.addEventListener('paste', check);
  }
});

function checkPasswordConfirmation(password, confirmation) {
  const isExact = confirmation.value.length === 0 || password.value === confirmation.value;
  if(isExact) {
    confirmation.classList.remove('wrong');
  }
  else {
    confirmation.classList.add('wrong');
  }
}
