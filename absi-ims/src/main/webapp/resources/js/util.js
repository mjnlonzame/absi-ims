 $(".required").focusout(function(){
// 	console.log("this is ",$(this));
	if($(this).val().trim() === ""){
		$(this).addClass("with-error");
	} else {
		$(this).removeClass("with-error");
	}
});
  
 function isFormValid(){
	 console.log("mjjj");
		$(".required").each(function(index){
			
			if( $(this).val().trim() === ""   ){
				$(this).addClass("with-error");
			} else {
				$(this).removeClass("with-error");
			}
		});
		
		$(".required-multiple").each(function(index){
			var values = $(this).val();
			if( values === null  ){
				$(this).addClass("with-error");
			} else {
				$(this).removeClass("with-error");
			}
		});

//	 	if*
//	 	console.log($(".required").hasClass("with-error"));
		
		return  !($(".required").hasClass("with-error"));
	}