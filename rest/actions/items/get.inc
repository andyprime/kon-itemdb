<?php
// items/get.inc

$query = "SELECT * FROM items ORDER BY item_number";
$result = $db->query($query);

if (mysqli_num_rows($result) > 0) {
    $resp = array();

    foreach($result as $item) {
        // this is old mysql style, don't expect it to work
        // $query = 'SELECT * FROM item_tags WHERE item_id="' . $item['item_id'] . '" ';
        // $db->query($query, SQL_ALL);
        // $tags = array();
        // foreach($db->record as $tag) {
        //     $tags[] = $tag['name'];
        // }
        $tags = [];
        $item['tags'] = $tags;
        $item['has_tags'] = count($tags) > 0;
        $resp[] = $item;
    }
}

?>