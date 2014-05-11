$.fn.simpleSelect = function() {
	var select = $(this);
	select.wrap('<span class="simple-select-wrapper" data-name="'+ select.attr('name') +'"></span>');
	var wrapper = select.closest('.simple-select-wrapper');
	var link = $('<a href="#" class="simple-select-link"></a>');
	var list = $('<ul class="simple-select-list"></ul>');
	wrapper.append(link);
	wrapper.append(list);

	setLink = function() {
		var selected_text = select.find('option:selected').text();
		if (selected_text.length === 0) { link.text('');            }
		else 														{ link.text(selected_text); }
	};

	buildList = function() {
		select.children('option').each(function() {
			var option = $(this);
			var li = $('<li data-value="'+ option.val() +'">'+ option.text() +'</li>');
			list.append(li);
		});
	};

	syncSelected = function() {
		list.children('li').removeClass('selected');
		list.children('li[data-value='+ select.find('option:selected').val() +']').addClass('selected');
	};

	updateSelected = function(v) {
		select.val(v);
		select.trigger('change');
	};

	link.on('click', function() {
		list.toggle();
		preventDefault();
	});

	list.on('click', 'li', function() {
		updateSelected($(this).data('value'));
	});

	select.on('change', syncSelected);

	setLink();
	buildList();
	syncSelected();
};

$(window).load(function() { $('select.simple-select').simpleSelect(); });
