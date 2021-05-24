<?php


require "dbconfig.php";
session_start();

$email=$_SESSION["email"];
$nome=$_SESSION["nome"];
$codice=$_SESSION["codice_utente"];
$titolo= mysqli_real_escape_string($conn, $_GET["titolo_out"]);




mysqli_query($conn, "DELETE FROM `pref_neg` WHERE `pref_neg`.`codice` = $codice AND `pref_neg`.`negozio` = '$titolo'  " );
mysqli_free_result($res);
mysqli_close($conn);// Chiudi connessione

 ?>
