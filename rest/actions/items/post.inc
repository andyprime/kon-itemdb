<?php

 $item_no = intval($data->item_number);
$value = intval($data->value);
$added_by = $data->added_by;
$description = $data->description;
$notes = $data->notes;

// $tags = trim($data['tags']);

if (!is_int($item_no)) {
  $err = 'That isnt a number.';
}

if ($item_no < 1) {
  $err = 'Bad item number.';
}

$query = 'SELECT * FROM items WHERE item_number="' . $item_no . '" ';
$result = $db->query($query);

if (mysqli_num_rows($result) > 0) {
  $err = 'That item number already exists.';
}

if (!$err) {

  $query = 'INSERT INTO items SET ';
  $query .= 'item_number="' . $item_no .'", ';
  $query .= 'value="' . $value . '", ';
  $query .= 'added_by="' . $added_by . '", ';
  $query .= 'description="' . $description . '", ';
  $query .= 'notes="' . $notes . '", ';
  $query .= 'date_added = NOW() ';
  
  if($db->query($query)) {
    // return the new data, as backbone will take the server response as authoritative
    $query = 'SELECT * FROM items WHERE item_number="' . $item_no . '" ';
    $freshResult = $db->query($query);
    $resp = $freshResult->fetch_assoc();
  } else {
    $err = 'A database error occured. Uh oh.';
    $err .= "\n\n";
    $err .= $query . "\n\n";
    $err .= $db->error;
  }

}
?>