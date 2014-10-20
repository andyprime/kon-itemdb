<?php

$item_id = $_REQUEST['item_id'];

$item_no = $_REQUEST['item_number'];

$type = $_REQUEST['type'];

//$added_by = $_REQUEST['edit_by'];

$notes = $_REQUEST['notes'];

$description = $_REQUEST['description'];

//$override = $_REQUEST['edit_override'];

//$handouts = $_REQUEST['edit_handout'];

$value = $_REQUEST['value'];

$tags = trim($_REQUEST['tags']);

if ($item_id > 0) {

	$query = 'SELECT * FROM items WHERE item_id="' . $item_id . '" ';
	$db->query($query, SQL_INIT);
	$item = $db->record;

	if ($item_no != $item['item_number']) {
		$query = 'SELECT * FROM items WHERE item_number="' . $item_no . '" ';
		$db->query($query, SQL_ALL);
		if (count($db->record) > 0) {
			$err = 'That item number already exists.';
			$element = 'item_no';
		}
	}

	if (!$err) {

		$query = 'UPDATE items SET ';
		$query .= 'item_number="' . $item_no .'", ';
		//$query .= 'type="' . $type . '", ';
		//$query .= 'added_by="' . $added_by . '", ';
		$query .= 'description="' . $description . '", ';
		$query .= 'notes="' . $notes . '", ';
		//$query .= 'include_in_lists="' . $handouts . '", ';
		$query .= 'value="' . $value . '", ';
		$query .= 'date_added = NOW() ';
		$query .= 'WHERE item_id="' . $item_id . '" ';
		$db->query($query, SQL_NONE);

		//echo $query . "\n";
		//echo $db->error . "\n";

		if ($db->error) {
			$err = 'A database error occured. Uh oh.';
		} else {
			$query = 'DELETE FROM item_tags WHERE item_id="' . $item_id . '" ';
			$db->query($query, SQL_NONE);

			if ($tags) {
				$taglist = explode(',', $tags);
				foreach ($taglist as $tag) {
					$query = 'INSERT INTO item_tags SET item_id="' . $item_id . '", name="' . trim($tag) . '" ';
					$db->query($query, SQL_NONE);
				}
			}
		}


	}
} else $err = 'No item id supplied.';


$json_arr = array();
if ($err) {
	$json_arr['success'] = 'N';
	$json_arr['err'] = $err;
	$json_arr['element'] = $element;
} else {
	$json_arr['success'] = 'Y';
	//$json_arr['item_no'] = $item_no;
	$json_arr['n'] = $item_no;

	$query = 'SELECT * FROM items WHERE item_id="' . $item_id . '" ';
	$db->query($query, SQL_INIT);
	$item = $db->record;
	$json_arr['row_html'] = getRowHTML($item, $type_classes[$item['type']] . '_lt', true);

}

//header('Content-type: text/javascript');
//header('X-JSON: ('. json_encode($json_arr) .')');

echo json_encode($json_arr);

?>