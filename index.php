<?php
include('inc/header.inc');
?>

<div id="optionsbar">
<ul>
<li id="btn_new" rel="#window_overlay">New</li>
<li>Search</li>
<li>Options</li>
<li>Export</li>
<li id="testbtn">Test</li>
</ul>

</div>

<div id="suboptions">
    Text search: <input type="text" id="text_search" /> &nbsp;&nbsp;&nbsp;&nbsp; <span id="taglist"></span> <input type="button" id="clearsearch" value="Clear" />
</div>

<div id="contentpane">
    <div class="page" id="items-page">
        <table id="item-table" cellspacing="0">
            <tr id="wait_row"><td colspan="9" align="center"><br /><br /><img src="img/indicator_medium.gif" /></td></tr>
            <tbody id="table-body"></tbody>
        </table>
    </div>
    <div class="page" id="options-page">
        Options!!!
    </div>
</div>
<div id="footer">
</div>

<?
include('inc/overlay.inc');
include('inc/templates.inc');
?>

</body>
</html>