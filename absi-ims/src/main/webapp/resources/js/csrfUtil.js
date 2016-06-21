
$(document).ready(function(){
	console.log("wew");
    var token = $("input[name='_csrf']").val();
    console.log("tokem is ", token);
    var header = "X-CSRF-TOKEN";
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});


function setCsrfTokeToAjax(){
	console.log("wew");
    var token = $("input[name='_csrf']").val();
    console.log("tokem is ", token);
    var header = "X-CSRF-TOKEN";
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
}