<?php

require "dbconfig.php";
// LISTA ARTICOLI

   $query= "SELECT codice_art,nome,prezzo FROM articolo";
    $res =  mysqli_query($conn, $query);
    $lista_dip = array();
    while ($row= mysqli_fetch_assoc($res)) {
      $lista_art[]= array('codice_art' => $row['codice_art'], 'nome' => $row['nome'],'prezzo' => $row['prezzo']);
    }
    echo json_encode($lista_art);

// MODIFICA COSTO ARTICOLO
    if (isset($_POST["input_articolo"]) && isset($_POST["input_prezzo"])) {
        $codice_art = mysqli_real_escape_string($conn, $_POST["input_articolo"]);
        $prezzo= mysqli_real_escape_string($conn, $_POST["input_prezzo"]);
        $query="call ModificaCosto(".$codice_art.",".$prezzo.")" or die ("Errore: " .mysqli_error($conn));
        $res =  mysqli_query($conn, $query);

        mysqli_close($conn);// Chiudi connessione
    }

 ?>
