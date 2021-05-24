<?php

 require "dbconfig.php";
session_start();

 $nome = $_GET['catena_negozi'];

 $query = "SELECT * FROM negozio WHERE nome_catena_app like '$nome'";


 $res = mysqli_query($conn,$query);
 $dati =array();
 while($row = mysqli_fetch_assoc($res)){
     array_push($dati,$row);
 }
 echo json_encode($dati);

?>
