<?php

// $id = $data->item_id;
$value = $data->value;
$added_by = $data->added_by;
$description = $data->description;
$notes = $data->notes;
$include = $data->include_in_lists;

// $tags = trim($data['tags']);

if ( (!is_numeric($id)) || $id <= 0) {
  $err = "That's a bad ID there";
  return;
}

if ( !$description || strlen($description) == 0 ) {
  $err = 'Blank descriptions are a no-no';
  return;
}

$query = 'UPDATE items SET ';
$query .= 'added_by="' . $added_by . '", ';
$query .= 'description="' . $description . '", ';
$query .= 'notes="' . $notes . '", ';
$query .= 'value="' . $value . '", ';
$query .= 'include_in_lists="' . $include . '" ';
$query .= 'WHERE item_id="' . $id . '" ';

if ($db->query($query)) {

  // TODO - update tags
  
  // return the updated object for PROCESSING REASONS
  $query = 'SELECT * FROM items WHERE item_id="' . $id . '"';
  $result = $db->query($query);
  $resp = $result->fetch_assoc();

} else {
  // if it returns false something went wrong
  $err = 'A database error occured. Uh oh. --- ';
  $err .= $db->error;
}

?>