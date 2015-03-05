var JukeboxClient = function() {
  this._currentSongIndex = 0;
  this._hasStarted = false;
  this._isPlaying = false;
};

JukeboxClient.prototype.playSong = function(songIndex, callback) {
  var song = this.songs[songIndex];

  callback(song.url, songIndex);
};

JukeboxClient.prototype.start = function(callback) {
  var that = this;

  $.get("queue/songs", function(data) {
    that.songs = JSON.parse(data);
    that._isPlaying = true;
    that._hasStarted = true;
    that.playSong(0, callback);
  });
};

JukeboxClient.prototype.pause = function(callback) {
  this._isPlaying = false;
  callback();
};

JukeboxClient.prototype.resume = function(callback) {
  this._isPlaying = true;
  callback();
};

JukeboxClient.prototype.addSong = function(songId, callback) {
  $.post("queue/add", { song_id: songId }, function(responseText) {
    callback(responseText);
  });
};

JukeboxClient.prototype.removeSong = function(songId, callback) {
  $.post("queue/remove", { song_id: songId }, function() {
    callback();
  });
};

JukeboxClient.prototype.playNextSong = function(callback) {
  this._currentSongIndex += 1;

  if(this.hasNextSong()) {
    this.playSong(this._currentSongIndex, callback);
  }else {
    console.log("There are no more songs to play");
  }
};

JukeboxClient.prototype.hasNextSong = function() {
  return this._currentSongIndex < this.songs.length;
};

JukeboxClient.prototype.isPlaying = function() {
  return this._isPlaying;
};

JukeboxClient.prototype.hasStarted = function() {
  return this._hasStarted;
};
