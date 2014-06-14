function updateCountdown() 
{  
  var remaining = 255 - jQuery('#micropost_content').val().length;
  jQuery('.countdown').text(remaining + ' characters remaining');
  if(remaining <= 0)
  {
	  $("input.btn.btn-large.btn-primary").attr("disabled", "true");
  }
  else
  {
	  $("input.btn.btn-large.btn-primary").removeAttr("disabled");
  }
}

jQuery(document).ready(function($) 
{
  updateCountdown();
  $('#micropost_content').change(updateCountdown);
  $('#micropost_content').keyup(updateCountdown);
});
