<?php

require "dbconfig.php";

// LISTA DEI DIPENDENTI CON STIPENDIO = 0
   $query= "SELECT codice_dip,nome FROM dipendente WHERE stipendio=0 or stipendio is NULL";
    $res =  mysqli_query($conn, $query);

    $lista_dip = array();
    while ($row= mysqli_fetch_assoc($res)) {
      $lista_dip[]= array('codice_dip' => $row['codice_dip'], 'nome' => $row['nome']);
    }
    echo json_encode($lista_dip);

// MODIFICA DELLO STIPENDIO
    if (isset($_POST["new_dip"]) && isset($_POST["input_stip"])) {
        $codice_dip = mysqli_real_escape_string($conn, $_POST["new_dip"]);
        $stipendio = mysqli_real_escape_string($conn, $_POST["input_stip"]);
        $query="call SetStipendio(".$codice_dip.",".$stipendio.")" or die ("Errore: " .mysqli_error($conn));
        $res =  mysqli_query($conn, $query);

        mysqli_close($conn);// Chiudi connessione
    }


 ?>
