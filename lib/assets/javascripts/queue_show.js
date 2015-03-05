$(document).ready(function() {

  var $player = $("audio#jukebox-player")[0];

  var jukebox = new JukeboxClient();
  var manipulator = new QueueDOMManipulator($player);

  var $playButton = $("button.play-button");
  var $pauseButton = $("button.pause-button");
  var $removeSongButton = $("a.remove-song");

  $playButton.on("click", function() {
    if(!jukebox.hasStarted()) {
      jukebox.start(bind(manipulator, manipulator.onPlaySong));
    }else if(!jukebox.isPlaying()){
      jukebox.resume(bind(manipulator.onResume));
    }
  });

  $player.addEventListener("ended", function() {
    jukebox.playNextSong(bind(manipulator, manipulator.onPlaySong));
  });

  $pauseButton.on("click", function() {
    jukebox.pause(bind(manipulator, manipulator.onPause));
  });

  $removeSongButton.on("click", function() {
    if(!jukebox.isPlaying()) {
      var songId = $(this).data("song-id");
      jukebox.removeSong(songId, reloadLocation);
    }else {
      $("#remove-song-modal").modal();
    }
  });

  var reloadLocation = function() {
    location.reload();
  };

  var bind = function(context, method) {
    return function() {
      method.apply(context, arguments);
    };
  };

});
