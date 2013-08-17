$(document).ready(function(){

	function createCheckBox(item){
		var box = $('<input>').attr('type','checkbox').val('yes').attr('name','items['+item+']');
		return box;
	}

	function createLabel(item){
		var label = $('<label>').attr('for', item).text(item);
		return label;
	}

	$(document).on('click', '.add_new_item', function(event){
		event.preventDefault();
		var item = $('#new_item').val();
		$('.create_sandwich').before(createLabel(item));
		$('.create_sandwich').before(createCheckBox(item));
		$('.create_sandwich').before($('<br>'));
	});

});