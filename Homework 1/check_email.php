<?php
require 'dbconfig.php';

  if (!isset($_GET["q"])) {
      echo "Errore";
      exit;
  }


  $email = mysqli_real_escape_string($conn, $_GET["q"]);
  $emaildb= array();

  $query = "SELECT email FROM utente";

  $res = mysqli_query($conn, $query) or die(mysqli_error($conn));

  while($row=mysqli_fetch_assoc($res)){
    $emaildb[]=array('email'=> $row['email']);
  }

  mysqli_free_result($res);
  mysqli_close($conn);

  echo json_encode($emaildb);

 ?>
