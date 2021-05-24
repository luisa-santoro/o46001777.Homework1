<?php
session_start();


require "dbconfig.php"; // o include is the same
$tipo = 'user';
$manager = 'manager';

// verifica esistenza di dati POST
    if (isset($_POST["email"]) && isset($_POST["password"])) {
        // credenziali verifica
        $email = mysqli_real_escape_string($conn, $_POST["email"]);
        $password = mysqli_real_escape_string($conn, $_POST["password"]);


        // query
        $query="SELECT codice_utente,nome,email,psw,tipo FROM utente WHERE email= '".$email."' AND psw= '".$password."'";
        $res = mysqli_query($conn, $query);
        // controllo se è manager
        if (mysqli_num_rows($res)>0) {
            while ($row = mysqli_fetch_assoc($res)) {
                $tipo = $row['tipo'];
                  $_SESSION["codice_utente"] =  $row['codice_utente'];
                  $_SESSION["nome"] =  $row['nome'];
                $_SESSION["email"] = $_POST["email"];
                setcookie("username", $row['email']);
            }

            if (strcmp($tipo, $manager) == 0) {
                header("Location: operazioni.php");
                exit;
            } else {
                header("Location: home.php");
                exit;
            }
        }
        $query="SELECT email,psw FROM dipendente WHERE email= '".$email."' AND psw= '".$password."'";
        $res = mysqli_query($conn, $query);
        // controllo se è manager
        if (mysqli_num_rows($res)>0) {
            setcookie("username", $email);
            header("Location: home.php");
         }else{
             $errore=  "Username e/o password errati.";
             echo "<script type='text/javascript'>alert('$errore');</script>";
        }

    }

?>

<html>
<link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@200&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./css/form_style.css">
    <body style="background-color: black;">
        <form method='post'>
            <p style="font-size: 30px;">  L O G I N </p>
            <p> Inserisci la tua Email:  </p>
            <input type='text'placeholder="Scrivi qui..." id="inputUser" name="email" required>
            <p> Inserisci la tua password:</p>
            <input type='password'placeholder="Scrivi qui..." id="inputPass" name="password" required><br><br>
            <input type='submit' id='submit' value='Invia'>
            <p>&ensp; &ensp; Non sei ancora registrato?&ensp;&ensp;</p>
             <a style="font-size: 15px; text-decoration: none; border: 1px solid white;" href="./signup.php" id="submit">Clicca qui!</a>
        </form>
    </body>
</html>
