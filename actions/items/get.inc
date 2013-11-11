<?
// items/get.inc

$query = 'SELECT * FROM items ORDER BY item_number';
$db->query($query, SQL_ALL);

$items = $db->record;

$resp = array();

foreach($items as $item) {
    $query = 'SELECT * FROM item_tags WHERE item_id="' . $item['item_id'] . '" ';
    $db->query($query, SQL_ALL);
    $tags = array();
    foreach($db->record as $tag) {
        $tags[] = $tag['name'];
    }
    $item['tags'] = $tags;
    $item['has_tags'] = count($tags) > 0;
    $resp[] = $item;
}

?>