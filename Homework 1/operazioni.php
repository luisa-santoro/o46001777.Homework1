<?php

session_start();
require "dbconfig.php";
require 'operazioni_database.php';
require 'mostra_dipendenti.php';
require 'modifica_articolo.php';
?>


<html>
<head>
  <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@200&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="./css/op.css">
  <script src="./js/operazioni.js" defer></script>
 </head>
<body>
  <form method="post" id="MyForm">
    <p style="font-size: 30px;">  - WELCOME MANAGER - </p>
    <input type="radio" name="tab" value="1" id="click_uno">&ensp;Aggiungi stipendio nuovi dipendenti<br>
    <br><input type="radio" name="tab" value="2" id="click_due">&ensp;Mostra tutti i dipendenti<br>
    <br><input type="radio" name="tab" value="3" id="click_tre">&ensp;Modifica il costo di un articolo<br>
     <div id="div1" class="hide" >
        <p> Scegli il dipendente:</p>
       <select name="new_dip" id="dip" >
        </select>
          <p> Inserisci lo stipendio:</p>
        <input type='text'placeholder="Scrivi qui..." id="inputUser" name="input_stip" ><br><br>
        <input type='submit' id='submit' value='Invia'>
      </div>
        <div id="div2" class="hide">
          <div id='lista_tutti_dip'> </div>
         <!-- <p>Codice Dipendente da Eliminare:</p>
         <input type='text'placeholder="Scrivi qui..." id="inputUser" name="input_codice" ><br><br> -->
         <!-- <input type='submit' id='submit' value='Invia'> -->
       </div>
       <div id="div3" class="hide">
         <select name="input_articolo" id="id_articolo" >
          </select>
          <p> Nuovo prezzo:</p>
          <input type='text'placeholder="Scrivi qui..." id="inputUser" name="input_prezzo"><br><br>
          <input type='submit' id='submit' value='Invia'>
        </div>
        <p id="errore_uno" class="hide"> Non ci sono nuovi dipendenti </p>
    </form>
</body>
</html>
