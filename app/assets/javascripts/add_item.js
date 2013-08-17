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
		$('.item_list').prepend($('<br>'));
		$('.item_list').prepend(createLabel(item));
		$('.item_list').prepend(createCheckBox(item));
		
	});

});