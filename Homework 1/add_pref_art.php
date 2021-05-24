<?php



require "dbconfig.php";
session_start();

$email=$_SESSION["email"];
$nome=$_SESSION["nome"];
$codice=$_SESSION["codice_utente"];
$titolo= mysqli_real_escape_string($conn, $_GET["titolo_out"]);

mysqli_query($conn, "INSERT INTO `pref_art`(`codice`,`nome`,`email`, `articolo`) VALUES(\"$codice\",\"$nome\",\"$email\", \"$titolo\")" );
mysqli_free_result($res);
 mysqli_close($conn);// Chiudi connessione

 ?>
