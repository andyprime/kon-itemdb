<?

$item_no = $data->item_number;
$value = $data->value;
$added_by = $data->added_by;
$description = $data->description;
$notes = $data->notes;

// $tags = trim($data['tags']);
  
$query = 'SELECT * FROM items WHERE item_number="' . $item_no . '" ';
$db->query($query, SQL_ALL);

if ($item_no < 1) {
  $err = 'Bad item number.';
}

if (count($db->record) > 0) {
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
  
  $db->query($query, SQL_NONE);

  // echo $query . "\n";
  // echo $db->error . "\n";

  if ($db->error) {
    $err = 'A database error occured. Uh oh.';
    $err .= "\n\n";
    $err .= $query . "\n\n";
    $err .= $db->error;
  } else {
    $resp['message'] = 'OK';
    $resp['pizza'] = 'ham';
    
    // return the new data, as backbone will take the server response as authoritative
    $query = 'SELECT * FROM items WHERE item_number="' . $item_no . '" ';
    $db->query($query, SQL_ALL);
    $resp = $db->record[0];
  }

}
?>