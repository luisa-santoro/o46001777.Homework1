function onJson(json) {
    console.log('JSON ricevuto');
    const library = document.querySelector('#box_album');
    library.innerHTML = '';
    
    const results = json.albums.items;
    let num_results = results.length;
    if(num_results > 10)
      num_results = 10;
      for(let i=0; i<num_results; i++) {
      const album_data = results[i];
      const title = album_data.name;
      const selected_image = album_data.images[0].url;
      const album = document.createElement('div');
      album.classList.add('album');
      const img = document.createElement('img');
      img.src = selected_image;
      const caption = document.createElement('span');
      caption.textContent = title;
      album.appendChild(img);
      album.appendChild(caption);
      library.appendChild(album);
    }
  }

  function onResponse(response) {
    console.log('Risposta ricevuta');
    return response.json();
  }

  function search(event) {
    event.preventDefault();
    const album_input = document.querySelector('#album');
    const album_value = encodeURIComponent(album_input.value);
    console.log('Eseguo ricerca: ' + album_value);
    fetch("spotify.php?q=" + album_value).then(onResponse).then(onJson);
  }

  function onTokenJson(json){
    token = json.access_token;
  }

  function onTokenResponse(response){
    return response.json();
  }



  const form = document.querySelector('#form_a');
  form.addEventListener('submit', search)





/*

  //SPOTIFY


  function onJsonMusic(json) {
    console.log(json);

    const album = document.querySelector('#album');
    album.innerHTML = '';

    const results = json.tracks.items;
    let num_results = results.length;

    if(num_results > 5)
      num_results = 5;

    for(let i=0; i<num_results; i++)
    {
       const track = document.createElement('div');
      track.classList.add('traccia');

      const id_music = results[i].id;
      const url_music="https://open.spotify.com/embed/track/"+id_music;
      const frame= document.createElement('iframe');
      frame.src=url_music;
      frame.width=300;
      frame.height=300;

      track.appendChild(frame);
      album.appendChild(track);

    }
  }

  function search_music(event)
  {

    event.preventDefault();

    const album_input = document.querySelector('#form_music .search');
    const track_value = encodeURIComponent(album_input.value);
    console.log('Eseguo ricerca: ' + track_value);

    fetch("spotify.php?q=" + track_value).then(onResponse).then(onJsonMusic);
  }



  // Aggiungi event listener al form
  const form_music = document.querySelector('#form_music');
  form_music.addEventListener('submit', search_music);


  */
