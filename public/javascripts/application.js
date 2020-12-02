
function formValidation (event) {

    const form = document.querySelector('#signup-form');
    const firstName = form.querySelector('#first_name').value;
    const lastName = form.querySelector('#last_name').value;
    const email = form.querySelector('#email').value;
    const password  = form.querySelector('#password').value;
    const repeatPassword = form.querySelector('#repeat_password').value;


    if (firstName === '' || lastName === '' || email === '' || password === '' || repeatPassword === '') {

        alert('Please fill in the blanks');
        event.preventDefault();

    } else if (password !== repeatPassword) {

        alert('Password are not matched');
        event.preventDefault();
    } 
    
}

document.querySelector('#signup-form')
.addEventListener('submit', formValidation, false);


setTimeout(() => {

    const message = document.querySelector('.message');
    message.style.display = 'none';

}, 4000)

ClassicEditor.create(document.getElementById('editor'));