$(document).on("page:change", function() {
	
	// Check if the current url is a stories edit page.
	var urlArray = window.location.href.split( '/' );
	if (urlArray[3] == "stories" && urlArray[5] == "edit")
	{
		// Check if it is the current user's turn.
		var $currentTurn = $('.storyfeed').data('story-turn');
		var $currentUser = $('.storyfeed').data('curruser');
		if($currentUser == $currentTurn)
		{
			var $storyid = $('.storyfeed').data('story-id'); 
			$.getScript('/microposts.js?story_id=' + $storyid );
 
			function refreshStories(){
				$.getScript('/microposts.js?story_id=' + $storyid);
			};
			// Wait 20 seconds before checking again.
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