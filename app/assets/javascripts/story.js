$(document).on("page:change", function() {
  var $storyid = $('.storyfeed').data('story-id'); 
//  alert("started story.js " + $('.storyfeed').data('story-turn') );
//    $.getScript('/stories.js?story_turn=' + $turn + "&turnchange=" + $turnchange );
  $.getScript('/microposts.js?story_id=' + $storyid );
 
  function refreshStories(){
    $.getScript('/microposts.js?story_id=' + $storyid);
  };
  setInterval(refreshStories, 10000);
});  
