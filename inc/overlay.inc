<div id="window_overlay" class="overlay">
<div id="formerr"></div>
<div>
<form id="item_form" action="index.php">

<div style="float: left; margin-right: 50px;">
Number<br />
<input type="number" size="6" id="item_no" name="item_number" required="required" />
<img src="img/find.png" id="get_num" title="Get first available" />
</div>
<div style="float: left;">
Value<br />
<input type="text" size="6" id="value" name="value" value="" />
</div>

<div style="clear: both;">
Description<br />
<textarea id="description" name="description"></textarea>
</div>

<div>
GM Notes<br />
<textarea id="notes" name="notes"></textarea>
</div>

<div>
Tags&nbsp;<span class="wee">(<a id="suggest">Suggest</a>)</span>
<input type="text" id="tags" name="tags" style="width: 90%" value=""/><br />
<!--<div id="tag_completer" style="display: none;"></div>-->
</div>


<div>
<input type="hidden" id="form_action" name="action" />
<input type="hidden" name="item_id" />
<button type="submit">Save</button>

</form>
</div>


</div>