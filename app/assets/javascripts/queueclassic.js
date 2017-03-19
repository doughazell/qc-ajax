jQuery.ajaxSetup({
    // "Rails determines the desired response format from the HTTP Accept header submitted by the client."
    
    // XMLHttpRequest (XHR) is browser's built-in functionality
   'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

// From Railscast #136 for Unobtrusive JS
jQuery.fn.submitWithAjax = function() {
	this.submit(function() {
    //http://www.w3schools.com/jquery/ajax_post.asp
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  })
	return this;
};

$(document).ready(function() {
  //alert('$(document).ready javascript func in queueclassic.js');
                  
  //$("#new_email").submitWithAjax();

  //https://api.jquery.com/submit/ - "It can only be attached to <form> elements."
  
  // 11/3/17 DH: Bit more Rails + Javascript stuff
  $('a#deliver').click(function () {
    //alert('Well at least we have something...');
    
    $('#flash_notice').slideDown();
    $('#flash_notice').html('Delivering letter ' + $(this).attr('href').split("/")[2] );
    setTimeout(function() {
      $('#flash_notice').slideUp();
    }, 3000);
    
    $.post($(this).attr('href'), $(this).serialize(), null, "script");
    return false;
  });
  
  $('#new_review').submit(function (){
    $.post($(this).attr('action'), $(this).serialize(), null, "script");
    return false;
  });                  
  
  // 14/8/16 DH: Removing flash notices in screen updated by JS.
  setTimeout(function() {
    $('#flash_notice').slideUp();
  }, 3000);

  //alert('$(document).ready END');
})