<?php
session_start();
require "dbconfig.php";




if(isset($_POST["email"]) && isset($_POST["password"]) && isset($_POST["nome"]) && isset($_POST["tipo"])){

    $nome = mysqli_real_escape_string($conn, $_POST["nome"]);
    //$email = mysqli_real_escape_string($conn, $_POST["email"]);
    // $password = mysqli_real_escape_string($conn, $_POST["password"]);
    $tipo = mysqli_real_escape_string($conn, $_POST["tipo"]);


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
    $query= "INSERT INTO utente(nome,email,psw,tipo) VALUES('$nome', '$email','$password','$tipo')";
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
        <form method='post' id="form" >
            <p style="font-size: 30px;" > R E G I S T R A Z I O N E</p>
            <p>Inserisci il tuo nome:    </p>
            <input type='text'placeholder="Scrivi qui..." id='input_user' name="nome" required>
            <p> Inserisci la tua e-mail:</p>
            <input type='text'placeholder="Scrivi qui..." id='input_user' name="email" required>
            <br> <span id="emailerr" class="hidden"> </span>
            <p> Inserisci la tua password:</p>
            <input type='password'placeholder="Scrivi qui..." id='input_user'name="password" required  >
            <br> <span id="pswerr" class="hidden"> </span>
            <p> &ensp; &ensp; &ensp; &ensp; Sei un cliente o un manager?&ensp; &ensp;&ensp; &ensp;</p>
            <input type='text'placeholder="Scrivi qui..."  id='input_user' name="tipo" required > <br><br>
            <input type='submit' id='submit' value='Invia'>
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
