$(document).ready(function() {

  $("a.add-song").on("click", function(){
    var song_id = $(this).data("song-id");

    $.post( "queue/add", { song_id: song_id });
  });

  $("a.remove-song").on("click", function(){
    var song_id = $(this).data("song-id");

    $.post( "queue/remove", { song_id: song_id }, function(){
      location.reload();
    });
  });

});
