<div id="taskoutter">
<div id="taskinner">

<div id="formerr"></div>

<form id="edit_item_form" action="index.php">

<div style="float: left; margin-right: 50px;">
Number<br />
<input type="text" size="6" id="item_no" name="item_number" value="<? echo $item['item_number']; ?>" />
</div>

<div style="float: left;">
Value<br />
<input type="text" size="6" id="value" name="value" value="<? echo $item['value']; ?>" />
</div>

<div style="clear: both;">
Description<br />
<textarea id="description" name="description"><? echo $item['description']; ?></textarea>
</div>

<div>
GM Notes<br />
<textarea id="notes" name="notes"><? echo $item['notes']; ?></textarea>
</div>

<div>
Tags&nbsp;<span class="wee">(<a id="suggest">Suggest</a>)</span>
<input type="text" id="tags" name="tags" style="width: 90%" value="<? echo implode(', ', $tags) ?>"/><br />
<div id="tag_completer" style="display: none;"></div>
</div>


<div>
<input type="hidden" name="edit_id" value="<? echo $item['item_id']; ?>" />
<input type="hidden" name="action" value="edit_save" />
<input type="submit" value="Save" />
</div>

</form>

<div id="closex">X</div>

</div>
</div>

<script type="text/javascript">

var item_id=<? echo $item['item_id']; ?>;

var all_tags = [<?
$query = 'SELECT name FROM `item_tags` GROUP BY name ';
$GLOBALS['db']->query($query, SQL_ALL);

$tags = $GLOBALS['db']->record;

foreach ($tags as $t) echo "'" . $t['name'] . "', ";
?>];

$('closex').observe('click', closeWindow);

$('edit_item_form').observe('submit', procForm);

$('suggest').observe('click', getSuggestions);

new Autocompleter.Local('tags', 'tag_completer', all_tags, {tokens: ', '});

function procForm(e) {
	Event.stop(e);
	$('formerr').update('');
	$$('.errorelement').each(function(name, index) {
		$(name).removeClassName('errorelement');
	});
	$('edit_item_form').request({ 
			onComplete: function(transport, json) {
				if (json.success == 'Y') {
					closeWindow();
					getContent('itemrow_' + json.n);
				} else {
					console.log('err');
					$('formerr').update(json.err + '<br />');
					$(json.element).addClassName('errorelement');
				}
			}
		}
	);
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