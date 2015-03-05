var QueueDOMManipulator = function(player) {
  this.$player = player;
};

QueueDOMManipulator.prototype.onPlaySong = function(songURL, songIndex){
  var sourceElement = this.createSourceElement(songURL);

  this.$player.appendChild(sourceElement);
  this.$player.play();

  this.updateHighlighting(songIndex);
};

QueueDOMManipulator.prototype.onPause = function(){
  this.$player.pause();
};

QueueDOMManipulator.prototype.onResume = function(){
  this.$player.play();
};

QueueDOMManipulator.prototype.updateHighlighting = function(songIndex){
  $currentSongRow = this.getCurrentSongRowElement(songIndex);
  $currentSongRow.addClass("playing-now");

  $previousSongRow = $currentSongRow.prev("tr.song-row");
  $previousSongRow.removeClass("playing-now");
};

QueueDOMManipulator.prototype.createSourceElement = function(songURL){
  var sourceElement = document.createElement('source');
  sourceElement.type = 'audio/mp3';
  sourceElement.src = songURL;

  return sourceElement;
}

QueueDOMManipulator.prototype.getCurrentSongRowElement = function(songIndex){
  return $("tr.song-row:eq(" + songIndex + ")");
};
