$(document).ready(function(){
	$(function(){
		$('.pantry > *').draggable({
			helper: "clone",
    		containment: "document"
		});
		$('.pantry').disableSelection();
		$('.sandwich').droppable({
			drop: function(event, ui){
				alert('dropped');
				ui.draggable.detach().appendTo($(this));
			},
			tolerance: "touch"
		});



	});
});