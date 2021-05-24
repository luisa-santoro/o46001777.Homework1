<!DOCTYPE html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8">
        <link rel="stylesheet" href="./css/catene_musicali.css">
        <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@200&display=swap" rel="stylesheet">
        <script src="./js/articoli_musicali.js" defer></script>
    </head>
    <body>
        <h1>Ecco gli articoli:</h1>
        <h2>Cerca Articolo: <input type="text" placeholder="Scrivi qui..." id="box_ricerca" style="margin-left: 10px"></h2>
        <section>
            <div id="Preferiti" class="hidden">
                <p>Ecco i tuoi preferiti:</p>
                <div id="fav_items"></div>
            </div>
            <div id="box">
                <div id="grid"></div>
            </div>
        </section>
    </body>
</html>
