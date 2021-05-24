<?php


require "dbconfig.php";
session_start();

$email=$_SESSION["email"];
$nome=$_SESSION["nome"];
$codice=$_SESSION["codice_utente"];
$titolo= mysqli_real_escape_string($conn, $_GET["titolo_out"]);

echo $email;


mysqli_query($conn, "DELETE FROM `pref_cat` WHERE `pref_cat`.`codice` = $codice AND `pref_cat`.`catena` = '$titolo'  " );
mysqli_free_result($res);
mysqli_close($conn);// Chiudi connessione

 ?>
