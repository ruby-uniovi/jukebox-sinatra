$(document).ready(function() {

  $("a.add-song").on("click", function(){
    var songId = $(this).data("song-id");

    $.post("queue/add", { song_id: songId }, function(confirmationMessage){
      var $modal = $("#add-song-modal");
      $modal.find('.modal-body p').text(confirmationMessage);
      $modal.modal();
    });
  });

  $("a.remove-song").on("click", function(){
    var songId = $(this).data("song-id");

    $.post("queue/remove", { song_id: songId }, function(){
      location.reload();
    });
  });

});
