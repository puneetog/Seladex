$(document).ready(function(){
	 $('#close_alert').click(function(){
		  ele = $(this).parent();
		  ele.hide('slow', function(){ 
	       ele.remove(); 
	      });
	  });
});