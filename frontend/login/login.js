const form = document.querySelector('form');
const uname = document.querySelector('#username');
const pword = document.querySelector('#password');

form.addEventListener('submit',login)
const url = '';
function login(event)
{
    event.preventDefault();
    const formData = new FormData(this);
    fetch(url,{
        method: 'post',
        body: formData
    }).then(function(response){
        return response.text();
    }).then(function(text){
        console.log(text);
    }).catch(function(error){
        console.error(error);
    })
}