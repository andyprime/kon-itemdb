<div id="taskoutter">
<div id="taskinner">

<form id="new_item_form">



<table>

<tr><td>
Number<br />
<input type="text" size="6" id="item_no" name="item_no" />
&nbsp;<img src="img/find.png" title="Find first unused number" class="button" id="number_gen" />
</td><td>
Value<br />
<input type="text" size="6" id="value" />
</td></tr>

<tr><td colspan="2">
Description<br />
<textarea id="description"></textarea>
</td></tr>

<tr><td colspan="2">
GM Notes<br />
<textarea id="notes"></textarea>
</td></tr>

<tr><td colspan="2">
Tags&nbsp;<span class="wee">(<span id="suggest">Suggest</span>)</span>
<input type="text" id="tags" style="width: 90%"/>
</td></tr>


<tr><td colspan="2">
<input type="submit" value="Save" />
</td></tr>

</table>
</form>


<div id="closex">X</div>

</div>
</div>

<script type="text/javascript">
$('closex').observe('click', closeWindow);
$('number_gen').observe('click', getFirstAvail);
$('new_item_form').observe('submit', procForm);
$('suggest').observe('click', getSuggestions);


function getFirstAvail(e) {
	new Ajax.Request('index.php', {
		parameters: {action: 'get_first_avail'},
		onComplete: function(transport) {
			$('item_no').value = transport.responseText;
		}
	});
}

function procForm(e) {
	Event.stop(e);
	console.log('GOGOGOGO!!!');
}

function getSuggestions() {
	new Ajax.Request('index.php', {
		parameters: {action: 'suggest_tags', description: $F('description'), notes: $F('notes'), tags: $F('tags'), value: $F('value')},
		onComplete: function(transport) {
			if (transport.responseText) {
				if ($F('tags')) $('tags').value = $F('tags') + ', ' + transport.responseText;
				else $('tags').value = transport.responseText;
			}
		}

	});
}
</script>