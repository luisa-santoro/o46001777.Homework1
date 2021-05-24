
function onJson_3(json) {
    console.log('JSON ricevuto');

    const email = document.querySelector('#box_email');
    email.innerHTML = '';
    
    console.log(json);
    // se le cose dentro il json con == a x messaggio di errore o successo

  const validation = json.deliverability;

switch(validation){
  case "UNDELIVERABLE":
  const new_div = document.createElement('div');
  new_div.textContent = "EMAIL NON VALIDA";
  box_email.appendChild(new_div);
  break;
  case "DELIVERABLE":
    const div_deliverable = document.createElement('div');
    div_deliverable.textContent = "OK EMAIL VALIDA";
    box_email.appendChild(div_deliverable);
    break;

    case "RISKY":
      const div_risky = document.createElement('div');
      div_risky.textContent = "EMAIL RISCHIOSA";
      box_email.appendChild(div_risky);
      break;

      case "UNKNOWN":
      const div_unknown = document.createElement('div');
      div_div_unknown.textContent = "EMAIL RISCHIOSA";
      box_email.appendChild(div_unknown);
      break;
  }
}

function onResponse_3(response) {
  console.log('Risposta ricevuta');
   return response.json();
}
      
      function search_3(event) {
        event.preventDefault();  // Impedisci il submit del form
        const email_input = document.querySelector('#email_input').value;  // Leggi valore del campo di testo
        const email_value = encodeURIComponent(email_input.value);
        console.log('Eseguo ricerca: ' + email_input);
        rest_url = "https://emailvalidation.abstractapi.com/v1/?api_key=af3dae2df9034730a46b910a216bcaff&email=" + email_input;
        fetch(rest_url).then(onResponse_3).then(onJson_3);    // Esegui fetch
      }
      
      // Aggiungi event listener al form
      const form_email = document.querySelector('#form_tre');
      form_email.addEventListener('submit', search_3);
    
