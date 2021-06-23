const contactForm = document.querySelector('.contact-form');

let name_ = document.getElementById('name');
let email = document.getElementById('email');
let subject = document.getElementById('subject');
let message = document.getElementById('message');

contactForm.addEventListener('submit', (e)=>{
    e.preventDefault();

    let formData = {
        name: name_.value,
        email: email.value,
        subject: subject.value,
        message: message.value
    }

    // Using XMLHttpRequest() to exchange data between the web site and a server
    let xhr = new XMLHttpRequest();
    xhr.open('POST', '/contact');
    xhr.setRequestHeader("content-type", "application/json");
    xhr.onload = function(){

        console.log(xhr.responseText);

        if(xhr.responseText == 'success'){

            alert('Email sent');
            name_.value = '';
            email.value = '';
            subject.value = '';
            message.value = '';
        }
        else {
            alert('OOPS');
        }
    }

    xhr.send(JSON.stringify(formData));

})