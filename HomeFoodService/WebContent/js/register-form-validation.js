$(document).ready(function() {
	
	$("#register_form").validate({
		rules: {
			firstname: {
				required: true,
				minlength: 2,
	    	    maxlength: 15
			},
			lastname: {
				required: true,
				minlength: 2,
				 maxlength: 15
			},
			email: {
				required: true,
				email: true
			},

		    password: {
	            required: true,
	            minlength: 6
	        },
	        password_confirm: {
	            required: true,
	            minlength: 6,
	            equalTo: "#password"
	        },
			phone: {
				required: true,
				number: true
			},
			phone2: {
				number: true
			}
		}
	});
	
	$("#profileChange").validate({
		rules: {
			firstname: {
				required: true,
				minlength: 2,
	    	    maxlength: 15
			},
			lastname: {
				required: true,
				minlength: 2,
				 maxlength: 20
			},
			email: {
				required: true,
				email: true
			},
			phone: {
				required: true,
				number: true
			},
			phone2: {
				number: true
			}
		}
	});
	
	$("#loginform").validate({
		rules: {
			email: {
				required: true,
				email: true
			},
			password: {
				required: true,
				minlength: 6
			}
		}
	});

	$("#pwdChange").validate({
		rules: {
			password: {
		            required: true,
		            minlength: 6
		        },
		    password_again: {
		            required: true,
		            minlength: 6,
		            equalTo: "#password"
		        }
		  }
		});
});	