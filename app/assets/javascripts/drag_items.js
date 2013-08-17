$(document).ready(function(){
	$(function(){
		$('.pantry').sortable();
		$('.pantry').disableSelection();
	});

	$(function(){
		$('.sandwich').droppable();
	});
});