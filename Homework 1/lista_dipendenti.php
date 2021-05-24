<?php

require "dbconfig.php";

// LISTA DEI DIPENDENTI
   $query= "SELECT codice_dip,nome FROM dipendente";
    $res =  mysqli_query($conn, $query);


    $lista_dip = array();
    while ($row= mysqli_fetch_assoc($res)) {
      $lista_dip[]= array('codice_dip' => $row['codice_dip'], 'nome' => $row['nome']);
    }
    echo json_encode($lista_dip);

 ?>
