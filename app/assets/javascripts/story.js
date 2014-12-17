$(document).on("page:change", function() {
	
	var urlArray = window.location.href.split( '/' );
	if (urlArray[3] == "stories" && urlArray[5] == "edit")
	{
		var $currentTurn = $('.storyfeed').data('story-turn');
		var $currentUser = $('.storyfeed').data('curruser');
		
		if($currentUser == $currentTurn)
		{
			var $storyid = $('.storyfeed').data('story-id'); 
			//  alert("started story.js " + $('.storyfeed').data('story-turn') );
			//    $.getScript('/stories.js?story_turn=' + $turn + "&turnchange=" + $turnchange );
  
			$.getScript('/microposts.js?story_id=' + $storyid );
 
			function refreshStories(){
				$.getScript('/microposts.js?story_id=' + $storyid);
			};
			setInterval(refreshStories, 20000);
		}
		else
		{
			return;
		}
	}
	else
	{
		return;
	}
}); 