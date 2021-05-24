document.getElementsByName('email')[0].addEventListener('blur', checkEmail);
document.getElementsByName('password')[0].addEventListener('blur', checkPsw);




function checkEmail(event){
  const email = event.currentTarget.value;
  const errore= document.getElementById('emailerr');

  if(!/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(String(email).toLowerCase())) {
      errore.classList.add('errore');
      errore.classList.remove('hidden');
      errore.textContent = "ERRORE: Email non valida";
  //    sub.disabled=true;
  } else {
      fetch("check_email.php?q="+encodeURIComponent(String(email.value).toLowerCase())).then(onResponseEmail).then(onJSONEmail);
  }
}

function onResponseEmail(response) {
  return response.json();
}

function onJSONEmail(json) {
  const errore= document.getElementById('emailerr');
  const email= document.getElementsByName('email')[0].value;

  for(let i in json){
    if (email !== json[i].email) {
        errore.classList.add('hidden');
        errore.classList.remove('errore');
        controllaForm();
    } else {
      errore.classList.add('errore');
      errore.classList.remove('hidden');
      errore.textContent=" ERRORE: Email già in uso!";
  //   sub.disabled=true;
      break;
    }
  }
}

function checkPsw(event){
  const passwordInput = event.currentTarget.value;
  const errore= document.getElementById('pswerr');

  if (passwordInput.length <4) {
    errore.classList.add('errore');
    errore.classList.remove('hidden');
    errore.textContent="ERRORE: Password troppo breve.";

    //sub.disabled=true;
  }else if(passwordInput.length> 10){
      errore.classList.add('errore');
      errore.classList.remove('hidden');
      errore.textContent="ERRORE: Password troppo lunga.";

    //  sub.disabled=true;
    }else if(!/^[A-Z]{1}$/.test(passwordInput.charAt(0))){
      errore.classList.add('errore');
      errore.classList.remove('hidden');
      errore.textContent="ERRORE: La prima lettera dev'essere maiuscola.";



  }else{

    errore.classList.add('hidden');
    errore.classList.remove('errore');
    controllaForm();
  }
}

function controllaForm(){

  Object.keys(formStatus).length !== 5 ||
// Controlla che i campi non siano false
Object.values(formStatus).includes(false);
}



const formStatus = {'Invia': true};
