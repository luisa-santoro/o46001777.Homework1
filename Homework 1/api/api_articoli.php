<?php

 require "dbconfig.php";


  $nome = $_GET['articolo'];

  $query = "SELECT * FROM articolo WHERE nome_neg_app like '$nome'";



 // $query = "SELECT * FROM articolo";
 $res = mysqli_query($conn,$query);
 $dati =array();
 while($row = mysqli_fetch_assoc($res)){
     array_push($dati,$row);
 }
 echo json_encode($dati);

?>
