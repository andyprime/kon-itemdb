<?php

// FUNCTIONS ---------------------------------------------------------------------

function getRowHTML($item, $class) {
	global $type_classes;

	$bit = '<tr id="ir' . $item['item_id'] . '" item="'. $item['item_id'] . '" class="itemrow ' . $type_classes[$item['type']] . ' ' . $class . '" >';

	$bit .= '<td class="numcol">&nbsp;' . $item['item_number'] . '</td>';

	$bit .= '<td>';
	$bit .= $item['description'];


	$query = 'SELECT * FROM item_tags WHERE item_id="' . $item['item_id'] . '" ORDER BY name ';
	$GLOBALS['db']->query($query, SQL_ALL);
	$tags = $GLOBALS['db']->record;
	if (count($tags) > 0) {
		$bit .= '<br /><span class="tags">Tags: ';
		foreach ($tags as $tag) {
			$bit .= '<a href="#" class="taglink" special="abc">' . $tag['name'] . '</a>, ';
		}
		$bit .= '</span>';
	}

	$bit .= '</td>';
	$bit .= '<td>' . $item['value'] . '</td>';
	$bit .= '<td><img class="editbtn" src="img/cog.png" item="' . $item['item_id'] . '" /></td>';

	$bit .= '</tr>';
	return $bit;
}

function getRowHTML2($item, $class, $open = false) {
	global $type_classes;

	if ($item['include_in_lists'] == 'y') $onoff = 'img/lightbulb.png';
	else $onoff = 'img/lightbulb_off.png';

	$bit = '<tr id="itemrow_' . $item['item_id'] . '" class="itemrow ' . $type_classes[$item['type']] . ' ' . $class . '" >';

	$bit .= '<td align="center" onclick="toggleDetails(' . $item['item_id'] . ')" >' . $item['item_number'] . '</td>';
	$bit .= '<td class="divcell" style="padding: 0px;"></td>';

	$bit .= '<td onclick="toggleDetails(' . $item['item_id'] . ')">' . $item['description'] . '</td>';
	$bit .= '<td class="divcell" style="padding: 0px;"></td>';

	$bit .= '<td align="center"><img src="' . $onoff . '" onclick="toggleVis(' . $item['item_id'] . ');" /></td>';
	$bit .= '<td class="divcell" style="padding: 0px;"></td>';

	$bit .= '<td align="center">' . $item['value'] . '</td>';
	$bit .= '<td class="divcell" style="padding: 0px;"></td>';

	$bit .= '<td align="center">' . mysqlToHuman($item['date_added']) . '</td>';
	$bit .= '<td class="divcell" style="padding: 0px;"></td>';

	$bit .= '<td align="center">' . $item['added_by'] . '</td>';
	$bit .= '<td class="divcell" style="padding: 0px;"></td>';

	$bit .= '</tr>';

	$bit .= '<tr><td colspan="11" align="center" style="padding: 0px;">';

	/*if ($open) $bit .= '<div id="details_' . $item['item_id'] . '" style="background-color: ' . $bgcolor . ';" class="detailbox">';
	else $bit .= '<div id="details_' . $item['item_id'] . '" style="display: none; background-color: ' . $bgcolor . ';" class="detailbox">';*/

	if ($open) $bit .= '<div id="details_' . $item['item_id'] . '" class="detailbox">';
	else $bit .= '<div id="details_' . $item['item_id'] . '" style="display: none;" class="detailbox">';

	$bit .= '<table style="width: 100%;"><tr class="' . $class . '">';
	$bit .= '<td width="100%"><b>Private description:</b><br />' . $item['notes'] . '</td>';

	$bit .= '<td>';
	if ($item['include_in_lists'] == 'y') $bit .= 'Public';
	else $bit .= 'Hidden';
	$bit .= '</td>';

	$bit .= '<td>';
	$bit .= '<input type="button" value="Edit" onclick="editItem(' . $item['item_id'] . ');" /><br />';
	$bit .= '<input type="button" value="Delete" onclick="deleteItem(' . $item['item_id'] . ');" /><br />';
	$bit .= '</td>';

	$bit .= '</tr></table>';

	$bit .= '</div></td></tr>';
	return $bit;
}

function archiveItem($item_id) {
	global $db;

	if ($item_id > 0) {
		$query1 = 'SELECT * FROM items WHERE item_id="' . $item_id . '" ';
		$db->query($query1, SQL_INIT);

		if (!$db->error) {
			$item = $db->record;

			$values = '("' . implode('", "', $item) . '") ';

			$query = 'INSERT INTO archive_items VALUES ' . $values;
			$db->query($query, SQL_NONE);
			if (!$db->error) {

				$query = 'DELETE FROM items WHERE item_id="' . $item_id . '" ';
				$db->query($query, SQL_NONE);
			} else $err = 'Database problem: ' . $db->error;
		} else $err = 'Database problem: ' . $db->error;
	}
}


?>
