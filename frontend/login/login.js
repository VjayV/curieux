const form = document.querySelectorAll('form');
const uname = document.querySelector('#username');
const pword = document.querySelector('#password');

console.log(form);
form[1].addEventListener('submit',function(event)
{
    event.preventDefault();
    console.log('inside function');
    const formData = form[1];
    fetch(url,{
        method: 'post',
        body: formData
    })
    // .then(function(response){
    //     return response.text();
    // }).then(function(text){
    //     console.log(text);
    // }).catch(function(error){
    //     console.error(error);
    // })
});
const url = 'http://localhost:8080/app/login';
console.log('Outside the function');
// function login(event)
// {
//     event.preventDefault();
//     console.log('inside function');
//     const formData = new FormData(this);
//     fetch(url,{
//         method: 'post',
//         body: formData
//     }).then(function(response){
//         return response.text();
//     }).then(function(text){
//         console.log(text);
//     }).catch(function(error){
//         console.error(error);
//     })
// }