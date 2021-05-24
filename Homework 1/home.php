
<?php
session_start();



   require 'dbconfig.php';
   	mysqli_close ($conn);
?>

<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="utf-8">
        <title>Market View</title>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Lobster&family=Train+One&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@200&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Lacquer&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lora:400,400i|Open+Sans:400,700" rel="stylesheet">
        <script src="./js/mhw3_spotify.js" defer></script>
        <script src="./js/mhw3_holidays.js" defer></script>
        <script src="./js/mhw3_newapi.js" defer></script>
        <link rel="stylesheet" href="./css/home.css">
    </head>
<body>
    <header>
        <nav>
            <div id="logo">
                Market View
            </div>

            <div id="links">
                <?php
                
                    if (isset($_COOKIE["username"]) &&  $_SESSION["email"]) {
                        echo "Bentornato/a" .$_SESSION["nome"];
                        ?>

                <a href="./logout.php"class="button">Logout</a>
                <?php
                    }else {
                        ?>
                         <a href="./login.php"class="button">Login</a>
                    <?php
                    }
                ?>
                <a href="./lavoraconnoi.php" class="button">Lavora Con Noi</a>
                <a href="./static/chisiamo.html" class="button">Chi Siamo</a>
               <a  href="./static/contatti.html" class="button">Contatti</a>
            </div>

            <div id="menu">
                <div></div>
                <div></div>
                <div></div>
              </div>
        </nav>

        <h1>
            Ovunque tu sia, noi ci siamo.<br/>
        </h1>
    </header>

               <div id="flex-container">
                   <div class="flex-item">
                    <a href="./catene_musicali.php" class="store_link">Store Musicali</a><br>
                 </div>
                   <!-- <div class="flex-item">
                    <a href="./catene_animali.php" class="store_link">Store Animali</a><br>
                    </div>
                   <div class="flex-item">
                    <a href="./catene_abbigliamento.php" class="store_link">Store Abbigliamento</a><br>
                 </div>
                <div class="flex-item">
                    <a href="./catene_alimentari.php" class="store_link">Store Alimentari</a><br>
                 </div>
                 <div class="flex-item">
                  <a href="./altri_store.php"class="store_link">Altri Store</a><br>
                 </div> -->
               </div>

               <form id="form_a">
                   <p>Cerca qui sotto la musica che troverai nei nostri store musicali!</p>
                   <input type='text'  placeholder="Scrivi qui..." id='album'  >
                   <input type='submit' id='submit' value='Cerca'>
                </form>
                <section id="box_album">
                </section>

                 <form id="form_h" >
                    <p>Controlla qui sotto il Paese in cui cerchi i nostri store, a causa delle festività potrebbero essere chiusi  </p>
                    <p>( Inserisci il codice del paese: es. Italia "it" ) </p>
                    <input type='text' placeholder="Scrivi qui..." id='holidays_country' >
                    <input type='submit' id='submit' value='Cerca'>
                 </form>
            <section id="box_holidays">
            </section>


            <form id="form_tre" >
                <p> Inserisci qui sotto la tua e-mail per restare aggiornato</p>
                <input type='text'placeholder="Scrivi qui..."id='email_input' >
                <input type='submit' id='submit' value='Cerca'>
             </form>
        <section id="box_email">
        </section>


    <footer>
        <p> Powered by Luisa Santoro o46001777</p>
      </footer>
</body>
</html>

  <!-- questo è un commento -->
