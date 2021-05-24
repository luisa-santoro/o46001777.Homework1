<?php

require "dbconfig.php";


if(isset($_POST["nome"]) && isset($_POST["data_nascita"]) && isset($_POST["telefono"]) && isset($_POST["email"]))
{
    $nome = mysqli_real_escape_string($conn, $_POST["nome"]);
    $data_nascita = mysqli_real_escape_string($conn, $_POST["data_nascita"]);
    $telefono = mysqli_real_escape_string($conn, $_POST["telefono"]);
  //  $email = mysqli_real_escape_string($conn, $_POST["email"]);
    //$password = mysqli_real_escape_string($conn, $_POST["password"]);





      if (filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
        $email = mysqli_real_escape_string($conn, strtolower($_POST['email']));
        $check_email= "SELECT email FROM utente WHERE email = '$email'";
        $res = mysqli_query($conn, $check_email);
        if (mysqli_num_rows($res) > 0) {
              $errore = "Errore, email già usata";
            }
          } else {
            $errore = "Errore";
          }

          if (strlen($_POST['password']) < 4 ) {
                $errore = "Errore, problema password.";
            }



          $password = mysqli_real_escape_string($conn, $_POST["password"]);


          if(!isset($errore)){
            $query= "INSERT INTO dipendente(nome,data_nascita,telefono,email,psw) VALUES('$nome','$data_nascita','$telefono','$email','$psw')";
            mysqli_query($conn,$query);
            $_SESSION["email"] = $_POST["email"];

            header("Location: login.php");
            exit;
          }
             mysqli_close($conn); // Chiudi connessione

          }

?>

<html>
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@200&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./css/form_style.css">
          <script src="./js/signup.js" defer></script>
    <body>
        <form method="post" id="form" >
            <p style="font-size: 30px;" > R E G I S T R A Z I O N E</p>
            <p style="font-size: 30px;" > D I P E N D E N T I</p>
            <p>Inserisci il tuo nome: &ensp;
            <input type='text'placeholder="Scrivi qui..."id='input_user' name="nome" required ></p>
            <p> &ensp;&ensp;Inserisci la tua data di nascita:
            <input type='date'placeholder="Scrivi qui..." id='input_user'name="data_nascita"  required >&ensp;&ensp; </p>
            <p> Inserisci il tuo telefono:&ensp;
            <input type='text'placeholder="Scrivi qui..." id='input_user'name="telefono"  required></p>
            <p> Inserisci la tua email:&ensp;
             <input type='text'placeholder="Scrivi qui..." id='input_user' name="email" required></p>
              <span id="emailerr" class="hidden"> </span>
             <p> Inserisci la tua password:&ensp;
            <input type='password'placeholder="Scrivi qui..." id='input_user'name="password"  required></p>
            <br> <span id="pswerr" class="hidden"> </span> <br>
          <br>  <input style="font-size: 25px; font-family: Work Sans;" type='submit' id='submit' value='Invia'>
        </form>
        <section>
        <div id='errori' class='hidden'></div>
    <?php
       if(isset($errore)){
         echo ("<p>".$errore."</p>");
       }
     ?>
   </section>
    </body>
</html>
