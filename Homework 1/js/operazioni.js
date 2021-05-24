
function onResponse(response){
  return response.json();
}


function onJsonArticolo(json) {


  document.getElementById('id_articolo').innerHTML = "";
  const x = document.getElementById('id_articolo');
  const form = document.getElementById('MyForm');

    document.getElementById('div1').style.display ='none';
        document.getElementById('div2').style.display ='none';
         document.getElementById('div3').style.display ='block';
      for(let i in json){
        const op = document.createElement("option");
        op.value = json[i].codice_art;
        op.textContent = json[i].nome;
        x.appendChild(op);
      }
}

function onJsonMostra(json) {
  document.getElementById('lista_tutti_dip').innerHTML = "";
  const x = document.getElementById('lista_tutti_dip');
  const form = document.getElementById('MyForm');
  document.getElementById('div1').style.display ='none';
  document.getElementById('div2').style.display ='block';
  document.getElementById('div3').style.display ='none';
  for(let i in json){
    const op = document.createElement("p");
    op.value = json[i].codice_dip;
    op.textContent = json[i].nome;
    op.classList.add("lista");
    x.appendChild(op);
  }
}

function onJsonDipendenti(json) {

    document.getElementById('dip').innerHTML = "";
    const x = document.getElementById('dip');
    const form = document.getElementById('MyForm');

    if(json.length == 0 ){
      document.getElementById('div1').style.display ='none';
      document.getElementById('div2').style.display ='none';
      document.getElementById('div3').style.display ='none';
      const message_p = document.getElementById("errore_uno");
      message_p.style.display = "block";
    }else{
      document.getElementById('div1').style.display ='block';
          document.getElementById('div2').style.display ='none';
           document.getElementById('div3').style.display ='none';
        for(let i in json){
          const op = document.createElement("option");
          op.value = json[i].codice_dip;
          op.textContent = json[i].nome;
          x.appendChild(op);
        }
    }
}

function gestisciDipendenti(){
  // da modificare fetch con ?
  fetch("http://localhost/Homework1/operazioni_database.php").then(onResponse).then(onJsonDipendenti);
  console.log(" ciao");

}

function gestisciMostra(){

  fetch("http://localhost/Homework1/mostra_dipendenti.php").then(onResponse).then(onJsonMostra);
  console.log(" mostra_console_op_2");
}

function gestisciArticoli(){
  fetch("http://localhost/Homework1/modifica_articolo.php").then(onResponse).then(onJsonArticolo);
  console.log(" mostra_console_op_2");
}

const bottone=document.querySelector('#click_uno');
bottone.addEventListener('click', gestisciDipendenti);

const bottone_due=document.querySelector('#click_due');
bottone_due.addEventListener('click',gestisciMostra);

const bottone_tre=document.querySelector('#click_tre');
bottone_tre.addEventListener('click', gestisciArticoli);
