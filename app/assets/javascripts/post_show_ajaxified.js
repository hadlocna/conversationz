$(function(){
  $(".upvote_link").on("ajax:success", function(event, data) {
    var voteSection = $(event.target).closest("p");

    $(voteSection).find(".upvote_count").text(data)
  });

  $(".downvote_link").on("ajax:success", function(event, data) {
    var voteSection = $(event.target).closest("p");

    $(voteSection).find(".downvote_count").text(data)
  });

});