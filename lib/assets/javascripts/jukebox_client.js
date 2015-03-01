var JukeboxClient = function() {
  this.currentSongIndex = 0;
};

JukeboxClient.prototype.playSong = function(songIndex, callback) {
  var song = this.songs[songIndex];

  callback(song.url);
};

JukeboxClient.prototype.start = function(callback) {
  var that = this;

  $.get("queue/songs", function(data){
    that.songs = JSON.parse(data);
    that.playSong(0, callback);
  });
};

JukeboxClient.prototype.addSong = function(songId, callback) {
  $.post("queue/add", { song_id: songId }, function(msg){
    callback(msg);
  });
};

JukeboxClient.prototype.removeSong = function(songId, callback) {
  $.post("queue/remove", { song_id: songId }, function(){
    callback();
  });
};

JukeboxClient.prototype.playNextSong = function(callback) {
  this.currentSongIndex += 1;

  if(this.hasNextSong()) {
    this.playSong(this.currentSongIndex, callback);
  }else {
    console.log("There are no more songs to play");
  }
};

JukeboxClient.prototype.hasNextSong = function(){
  return this.currentSongIndex < this.songs.length;
};
