$(document).ready(function() {

  var jukebox = new JukeboxClient();
  var $player = $("audio#jukebox-player")[0];

  $("button.play-button").on("click", function() {
    if(!jukebox.hasStarted()) {
      jukebox.start(playSongByURL);
    }else if(!jukebox.isPlaying()){
      jukebox.resume(onResume);
    }
  });

  $player.addEventListener("ended", function() {
    jukebox.playNextSong(playSongByURL);
  });

  $("button.pause-button").on("click", function() {
    jukebox.pause(onPause);
  });

  $("a.remove-song").on("click", function() {
    if(!jukebox.isPlaying()) {
      var songId = $(this).data("song-id");
      jukebox.removeSong(songId, reloadLocation);
    }else {
      $("#remove-song-modal").modal();
    }
  });

  var playSongByURL = function(songURL, songIndex) {
    var sourceElement = createSourceElement(songURL);

    $player.appendChild(sourceElement);
    $player.play();

    updateHighlighting(songIndex);
  };

  var onPause = function(){
    $player.pause();
  };

  var onResume = function(){
    $player.play();
  };

  var reloadLocation = function() {
    location.reload();
  };

  var createSourceElement = function(songURL) {
    var sourceElement = document.createElement('source');
    sourceElement.type = 'audio/mp3';
    sourceElement.src = songURL;

    return sourceElement;
  }

  var updateHighlighting = function(songIndex) { //Extract to class: playing :)
    $currentSongRow = $("tr.song-row:eq(" + songIndex + ")");
    $currentSongRow.css("background-color", "#E8E6B3");

    $previousSongRow = $currentSongRow.prev("tr.song-row");
    $previousSongRow.css("background-color", "white");
  };

});
