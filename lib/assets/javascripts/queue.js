$(document).ready(function() {

  var $player = $("audio#jukebox-player")[0];
  var songIndex = 0;
  var urls = [];

  $player.addEventListener("ended", function(e){
    playNextSong();
  });

  $("button.play-button").on("click", function(){
    $.get("queue/sources", function(data){
      urls = JSON.parse(data);
      playSong(0);
    });
  });

  $("button.stop-button").on("click", function(){
    $player.pause();
  });

  var createSourceElement = function(url){
    var sourceElement = document.createElement('source');
    sourceElement.type = 'audio/mp3';
    sourceElement.src = url;

    return sourceElement;
  };

  var playSong = function(songIndex){
    var url = urls[songIndex];
    var source = createSourceElement(url);

    $player.appendChild(source);
    $player.play();
  };

  var playNextSong = function(){
    songIndex += 1;

    if(songIndex < urls.length) {
      playSong(songIndex);
    }else {
      console.log("There are no more songs to play");
    }
  };

});
