<?php

$id = $data->item_id;
$value = $data->value;
$added_by = $data->added_by;
$description = $data->description;
$notes = $data->notes;

// $tags = trim($data['tags']);
  
$query = 'UPDATE items SET ';
$query .= 'added_by="' . $added_by . '", ';
$query .= 'description="' . $description . '", ';
$query .= 'notes="' . $notes . '", ';
$query .= 'value="' . $value . '" ';
$query .= 'WHERE item_id="' . $id . '" ';
$db->query($query, SQL_NONE);
// echo $query . "\n";
// echo $db->error . "\n";

if ($db->error) {
  $err = 'A database error occured. Uh oh. --- ';
  $err .= $query . " --- ";
  $err .= $db->error;
} else {
  // return the new data, as backbone will take the server response as authoritative
  $query = 'SELECT * FROM items WHERE item_id="' . $id . '" ';
  $db->query($query, SQL_ALL);
  $resp = $db->record[0];
}

?>