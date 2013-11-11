<?
// tags/get.inc

$query = 'SELECT DISTINCT name from item_tags';
$db->query($query, SQL_ALL);
$tags = array();
foreach ($db->record as $t) {
        $tags[] = $t['name'];
}
$resp = $tags;




?>