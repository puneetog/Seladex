$(document).ready(function(){
	 $('#close_alert').click(function(){
		  ele = $(this).parent();
		  ele.hide('slow', function(){ 
	       ele.remove(); 
	      });
	  });

	 $('#copy_mailing_address').click(function(){
	 	var mailing = "Mailing"
	 	var billing = "Billing"	

	 	var mailing_address = $("#address_"+mailing)
	 	var mailing_city = $("#city_"+mailing)
	 	var mailing_state = $("#state_"+mailing)
	 	var mailing_zip = $("#zip_"+mailing)
	 	var mailing_country = $("#country_"+mailing)
	 	var mailing_phone = $("#phone_"+mailing)
	 	var mailing_fax = $("#fax_"+mailing)

	 	var billing_address = $("#address_"+billing)
	 	var billing_city = $("#city_"+billing)
	 	var billing_state = $("#state_"+billing)
	 	var billing_zip = $("#zip_"+billing)
	 	var billing_country = $("#country_"+billing)
	 	var billing_phone = $("#phone_"+billing)
	 	var billing_fax = $("#fax_"+billing)

	 	
	    if($('#copy_mailing_address').is(':checked')){
	        billing_address.val(mailing_address.val());
	        billing_city.val(mailing_city.val());
	        billing_state.val(mailing_state.val());
	        billing_zip.val(mailing_zip.val());
	        billing_country.val(mailing_country.val());
	        billing_phone.val(mailing_phone.val());
	        billing_fax.val(mailing_fax.val());
	    }
	    else{
	    	billing_address.val('');
	    	billing_city.val('');
	    	billing_state.val('');
	    	billing_zip.val('');
	    	billing_country.val('');
	    	billing_phone.val('');
	    	billing_fax.val('');
     	};

	});


});