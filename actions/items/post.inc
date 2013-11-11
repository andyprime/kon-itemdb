<?

$item_no = $data->item_number;
$value = $data->value;
$added_by = $data->added_by;
$description = $data->description;
$notes = $data->notes;

// $tags = trim($data['tags']);
  
$query = 'SELECT * FROM items WHERE item_number="' . $item_no . '" ';
$db->query($query, SQL_ALL);
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

  echo $query . "\n";
  echo $db->error . "\n";

  if ($db->error) {
    $err = 'A database error occured. Uh oh.';
    $err .= "\n\n";
    $err .= $query . "\n\n";
    $err .= $db->error;
  } else {
    $resp[] = 'OK';
    // $query = 'DELETE FROM item_tags WHERE item_id="' . $item_id . '" ';
    // $db->query($query, SQL_NONE);

    // if ($tags) {
    //   $taglist = explode(',', $tags);
    //   foreach ($taglist as $tag) {
    //     $query = 'INSERT INTO item_tags SET item_id="' . $item_id . '", name="' . trim($tag) . '" ';
    //     $db->query($query, SQL_NONE);
    //   }
    // }
  }


}

?>
