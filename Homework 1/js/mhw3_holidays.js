function onJson_2(json) {
    console.log('JSON ricevuto');
   const holidays = document.querySelector('#box_holidays');   // Svuotiamo la libreria
    holidays.innerHTML = '';  // ottiene o imposta il markup HTML o XML contenuto all'interno dell'elemento
  
console.log(json);
const results = json.response.holidays;
let num_results = results.length;
console.log(num_results);
    for(let i=0; i<num_results; i++) {
        const holiday_data = results[i];
        console.log(holiday_data);
      const nome = holiday_data.name;
    const div_uno = document.createElement('div');
  div_uno.classList.add('stile_desc');
    const name = document.createElement('span');
    nome.textContent = holiday_data.name;
    const desc = document.createElement('span');
    desc.textContent = holiday_data.description;
    holidays.appendChild(div_uno);
    div_uno.appendChild(name);
    div_uno.appendChild(desc);
  }
}
      
      function onResponse_2(response) {
        console.log('Risposta ricevuta');
        return response.json(); 
      }
      
      function search_2(event)
      {
        event.preventDefault();  // Impedisci il submit del form
        const country_input = document.querySelector('#holidays_country').value;  // Leggi valore del campo di testo
        // const holidays_country_value = encodeURIComponent(country_input.value);
        console.log('Eseguo ricerca: ' + country_input + 2021);
        rest_url = "https://calendarific.com/api/v2/holidays?&api_key=50aac2948e0d63a2f6565c1d7d9a8ca1625eee40&country= " + country_input + "&year=" + year;
        fetch(rest_url).then(onResponse_2).then(onJson_2);    // Esegui fetch
      }
      
      // Aggiungi event listener al form
      const form_2 = document.querySelector('#form_h');
      form_2.addEventListener('submit', search_2)
    
      // current_year -> anno del currentDate() in js 
      var today = new Date();
      var year = today.getFullYear();

   

 