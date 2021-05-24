<?php
 require "dbconfig.php";

 $query = "SELECT * FROM catena_negozi";
 $res = mysqli_query($conn,$query);

 $dati =array();
 while($row = mysqli_fetch_assoc($res)){
     array_push($dati,$row);
 }

 echo json_encode($dati);

?>
