$(function() {
  new MainView()
});



// var availableTags = [];
// var selectedtags = new Array();
// //var headerheight = 62 + 34 + 28 + 20;
// var headerheight;
// var noncontentheight;
// var firsttime = true;



// $(function() {
//         //window.vm_list_tpl = _.template($('#vm_list_tpl').html())
//         window.vm_list_tpl = $('#vm_list_tpl').html();
            
// 	// bind various events and such as
// 	window.onresize = resizeBody;

// 	// $('#btn_new[rel]').overlay({
// 	// 	mask: {
// 	// 		color: '#006699',
// 	// 		loadSpeed: 200,
// 	// 		opacity: 0.8
// 	// 	},
// 	// 	onBeforeLoad: newWindow
// 	// });
	
// 	$('#clearsearch').on('click', clearSearch);
	
// 	$(document).on('click', '.taglink', selectTag);
// 	$(document).on('click', '.editbtn', editWindow);
	
// 	$('#item_form').on('submit', submitForm);
	
// 	$('#suggest').on('click', getSuggestions);
// 	$('#testbtn').on('click', doTest);

// 	$( "#tags" )
// 		// don't navigate away from the field on tab when selecting an item
// 		.bind( "keydown", function( event ) {
// 			if ( event.keyCode === $.ui.keyCode.TAB &&
// 				$( this ).data( "autocomplete" ).menu.active ) {
// 				event.preventDefault();
// 			}
// 		});
	
// 	// $( "#tags" )	
// 	// 	.autocomplete({
// 	// 		minLength: 0,
// 	// 		source: function( request, response ) {
// 	// 			// delegate back to autocomplete, but extract the last term
// 	// 			response( $.ui.autocomplete.filter(
// 	// 				availableTags, extractLast( request.term ) ) );
// 	// 		},
// 	// 		focus: function() {
// 	// 			// prevent value inserted on focus
// 	// 			return false;
// 	// 		},
// 	// 		select: function( event, ui ) {
// 	// 			var terms = split( this.value );
// 	// 			// remove the current input
// 	// 			terms.pop();
// 	// 			// add the selected item
// 	// 			terms.push( ui.item.value );
// 	// 			// add placeholder to get the comma-and-space at the end
// 	// 			terms.push( "" );
// 	// 			this.value = terms.join( ", " );
// 	// 			return false;
// 	// 		}
// 	// 	});
		
// 	$('#get_num').on('click', getFirstNumber);
	
// 	// initialize page
// 	resizeBody();
//         $('#items-page').show();
// 	getContent();
// 	refreshTags();
// 	$('#contentpane').scrollTo(0);
// });

// function doTest() {
    
// }

// function refreshTags() {
// 	$.ajax({
// 		url: 'server/tags/',
// 		dataType: 'json',
// 		success: function(json) {
// 			availableTags = json.tags;
// 		}
// 	});
// }

// function resizeBody() {
// 	var height = window.innerHeight || (window.document.documentElement.clientHeight || window.document.body.clientHeight)
// 	headerheight = $('#banner').outerHeight() + $('#optionsbar').outerHeight() + $('#suboptions').outerHeight();
// 	noncontentheight = headerheight + $('#footer').outerHeight();
// 	var subheight = height - noncontentheight;
// 	$('#contentpane').css('height', subheight + 'px');
// }

// function getContent(id) {
//     allItems = new Items();
//     allItems.fetch(); // this could conceivably go into the collection view constructor
    
//     var v = new itemTableView({collection: allItems, el: $('#table-body')});
// }

// function myScrollTo(id) {
// 	//console.log('scrolling to row: ' + id);
// 	var selector = 'tr[item="' + id + '"]';
	
// 	var a = $(selector).offset()['top'];
// 	var ax = $('#ir' + id).position()['top'];
// 	console.log('Regular offset: ' + a + ', ' + ax);
// 	var b = $('#contentpane').scrollTop();
// 	console.log('Scroll top: ' + b);
// 	console.log('Header: ' + headerheight);
// 	var realOffset = b + a - headerheight;
// 	console.log('realOffset used: ' + realOffset);
	
// 	realOffset = $(selector).position()['top'];
// 	if (realOffset <= 0) {
// 		realOffset += $('#contentpane').scrollTop();
// 	}
	
// 	//console.log('offset used: ' + realOffset);
	
// 	$('#contentpane').animate({scrollTop: realOffset}, 400);
// 	$(selector).effect('pulsate');
// }

// function emptyList() {
// 	$('#table-body').html("");
// }

// function newWindow(e) {
// 	clearForm();
// 	$('#form_action').val('new');
// }

// function editWindow(e) {
// 	disableForm();
// 	$('#btn_new').data('overlay').load();

// 	$.ajax({
// 		url: 'server.php',
// 		data: {action: 'getItemData', id: $(e.target).attr('item')},
// 		dataType: 'json',
// 		success: function(json) {
// 			$('#item_form input,textarea').each(function(e) { 
// 				$(this).val(json[this.name]);
// 			});
// 			enableForm();
// 		}
// 	});
// }

// function submitForm() {
// 	$('#item_form').ajaxSubmit({
// 		url: 'server.php',
// 		type: 'POST',
// 		dataType: 'json',
// 		success: function(json) {
// 			if (json.success=='Y') {
// 				$('#btn_new').data('overlay').close();
// 				getContent(json.scrollto);
// 			} else {
// 				$('#formerr').html(json.err + '<br />');
// 			}
// 			enableForm();
// 		}
// 	});
// 	disableForm();
// 	return false;
// }

// function disableForm() {
// 	$('#item_form input').attr("disabled", "disabled");
// 	$('#item_form textarea').attr("disabled", "disabled");
// 	$('#item_form button').attr("disabled", "disabled");
// }

// function enableForm() {
// 	$('#item_form input').removeAttr("disabled");
// 	$('#item_form textarea').removeAttr("disabled");
// 	$('#item_form button').removeAttr("disabled");
// }

// function clearForm() {
// 	$('#item_form input').val('');
// 	$('#item_form textarea').val('');
// }


// function selectTag(event) {
// 	tagname = $(this).html();
// 	if (! in_array(tagname, selectedtags) ) {
// 		selectedtags.push(tagname);
// 		taglist = array_implode(selectedtags, ", ");
// 		$('#taglist').html('Tags: ' + taglist);
// 	}
// 	getContent();
// }

// function clearSearch(event) {
// 	selectedtags = new Array();
// 	$('#taglist').html('');
// 	getContent();
// }

// function getSuggestions() {
// 	data = {
// 		action: 'suggest_tags',
// 		description: $('#description').val(),
// 		notes: $('#notes').val(),
// 		tags: $('#tags').val(),
// 		value: $('#value').val()
// 	};
	
// 	$.ajax({
// 		url: 'server.php',
// 		data: data,
// 		success: function(html) {
// 			ct = $('#tags').val();
// 			if ( ct != '') {
// 				last1 = ct.substr(ct.length - 1, 1);
// 				last2 = ct.substr(ct.length - 2, 2);
// 				spacer = ', ';
// 				if (last1 == ',' ) spacer = ' ';
// 				if (last2 == ', ') spacer = '';
				
// 				$('#tags').val($('#tags').val() + spacer + html);
// 			} else {
// 				$('#tags').val(html);
// 			}
// 		}
// 	});
// }

// function getFirstNumber() {
// 	$.ajax({
// 		url: 'server.php',
// 		data: {action: 'get_first_avail'},
// 		dataType: 'json',
// 		success: function(json) {
// 			$('#item_no').val(json.number);
// 		}
// 	});
// }

// // utility functions
// function in_array(needle, haystack) {
// 	for(i = 0; i < haystack.length; i++) {
// 		if (haystack[i] == needle) {
// 			return true;
// 		}
// 	}
// 	return false;
// }


// function array_implode(source, glue) {
// 	var composite = "";
// 	for (i = 0; i < source.length; i++) {
// 		if (i + 1 == source.length) composite += source[i];
// 		else composite += source[i] + glue;
// 	}
// 	return composite;
// }


// // autocomplete functions
// function split( val ) {
// 	return val.split( /,\s*/ );
// }
// function extractLast( term ) {
// 	return split( term ).pop();
// }