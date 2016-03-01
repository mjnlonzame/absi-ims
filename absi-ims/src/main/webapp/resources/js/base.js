(function(){
	var errorDialogTemplate = _.template(
			'<div id="error-message-dialog" title=" <%=title%> " >'+
				'<div class="failed-msg">'+
					'<p> <%= message %></p>'+
				'</div>'+
			'</div>'
			);
	
	window.ErrorHandlers = {
		ajaxErrorHandler : function(status, response){//response expects a javascript object, e.g. the responseJSON of a jqXhr
			errorDialog = errorDialogTemplate({title:response.title, message:response.message})
			$(errorDialog).dialog({
				resizable : false,
				buttons: [
				          {
				        	  text: "Close",
				        	  click: function(){
				        		  $(this).dialog("close");
				        	  }
				          }
				         ],
				modal: true
			});
		}
	}
})();