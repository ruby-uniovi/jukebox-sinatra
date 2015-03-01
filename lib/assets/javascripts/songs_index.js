$(document).ready(function() {

  var jukebox = new JukeboxClient();

  $("a.add-song").on("click", function(){
    var songId = $(this).data("song-id");

    jukebox.addSong(songId, launchModal);
  });

  var launchModal = function(msg){
    var $modal = $("#add-song-modal");

    $modal.find('.modal-body p').text(msg);
    $modal.modal();
  };

});
