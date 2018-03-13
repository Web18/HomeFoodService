$(document).ready(function() {
	
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
	
	$("#registeration").validate({
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
				number: true,
				minlength: 6
			}
		}
	});
	
	$("#change_profile").validate({
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
				number: true,
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
		    }
		  }
	});
	
	$("#changeAddress").validate({
		rules: {
			address1: {
				required: true,
				minlength: 4,
	    	    maxlength: 25
			},
			address2: {
				minlength: 2,
	    	    maxlength: 15
			},
			city: {
				required: true,
				minlength: 2,
	    	    maxlength: 15
			},
			province: {
				required: true,
				minlength: 2,
				maxlength: 15
			},
			postalcode: {
				required: true,
				minlength: 6,
				maxlength: 10
			},
			phone: {
				required: true,
				number: true,
				minlength: 8,
				maxlength: 14
			},
			buzzer: {
				minlength: 2,
				maxlength: 10
			}
		}
	});
});	