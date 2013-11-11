<?php
require_once('lib/db.php');
require_once('inc/instance.inc');

$db = $GLOBALS['db'] = new dbConnect($GLOBALS['instance']['app_name'], $GLOBALS['instance']['database']);

$uri = $_SERVER['REQUEST_URI'];
$bits = split('/', $uri);
if ($bits[count($bits)] == '') {
    unset($bits[count($bits)]);
}

// $index = array_search('server', $bits);
// $path = array_slice($bits, $index + 1);

$model = $bits[3];
$id = $bits[4];

$method = strtolower($_SERVER['REQUEST_METHOD']);



$data = json_decode(file_get_contents('php://input'));
$resp = array();
include('actions/' . $model . '/' . $method . '.inc');

if($err) {
  header('HTTP/1.1 400 Bad Request', true, 400);
  echo $err;
} else {
  header('Cache-Control: no-cache, must-revalidate');
  header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
  header('Content-type: application/json');

  echo json_encode($resp);
}


/*

if ($_REQUEST['action'] != '') {

    $action = $_REQUEST['action'];

    if ($action == 'get_items_json') {
        
        $query = 'SELECT * FROM items';
        $db->query($query, SQL_ALL);
        
        
        
    }

    if ($action == 'get_items') {

            $search = $_REQUEST['search'];
            if ($_REQUEST['tags']) $tags = explode('|', $_REQUEST['tags']);

            $query = 'SELECT DISTINCT items.* FROM items ';
            if (count($tags) > 0) $query .= ', item_tags ';
            $query .= 'WHERE 1 ';
            if ($search) $query .= ' AND (description LIKE "%' . $search . '%" OR notes LIKE "%' . $search . '%") ';
            if (count($tags) > 0) {
                    $query .= ' AND items.item_id=item_tags.item_id AND item_tags.name IN ("' . implode('", "', $tags) . '") ';
                    $query .= ' GROUP BY items.item_id HAVING COUNT(*)= ' . count($tags) . ' ';
            }
            $query .= 'ORDER BY item_number ';
            $db->query($query, SQL_ALL);
            //echo $query . "\n";

            $items = array();
            foreach ($db->record as $item) {
                    $items[] = $item;
            }
            $i = 1;
            $count = 0;

            $ret = '';
            foreach ($items as $item) {
                    if ($last_type == $item['type'] || !$last_type) $count++;
                    else $count = 1;
                    $toggle = $count % 2;

                    $class = $type_classes[$item['type']] . '_' . ($toggle?'lt':'dk');

                    $ret .= getRowHTML($item, $class);

                    $last_type = $item['type'];
                    $i++;
            }
            
            echo json_encode(array('html' => $ret));
    }

    if ($_REQUEST['action'] == 'get_first_avail') {
            $query = 'SELECT * FROM items ORDER BY item_number ';
            $db->query($query, SQL_ALL);
            $current = 1;
            foreach ($db->record as $item) {
                    if ($item['item_number'] != $current) {
                            break;
                    } else $current++;
            }
            //if (!$result) $result = count($db->record) + 1;
            
            echo json_encode(array('number' => $current));
    }

    if ($_REQUEST['action'] == 'suggest_tags') {
            // this bit is really long so it's in a seperate file
            include('inc/suggest.inc');
    }

    if ($_REQUEST['action'] == 'getItemData') {
            $query = 'SELECT * FROM items WHERE item_id = "' . $_REQUEST['id'] . '" ';
            $db->query($query, SQL_INIT);
            $item = $db->record;

            $query = 'SELECT * FROM item_tags WHERE item_id="' . $_REQUEST['id'] . '" ';
            $db->query($query, SQL_ALL);
            $rows = $db->record;

            $tags = array();
            foreach ($rows as $row) $tags[] = $row['name'];
            $item['tags'] = implode(', ', $tags);
            $item['action'] = 'edit';

            echo json_encode($item);
    }

    if ($_REQUEST['action'] == 'edit') {
            include('inc/edit_save.inc');
    }

    if ($_REQUEST['action'] == 'new') {

            $fields = array('item_number', 'description', 'notes', 'type', 'value');
            $info = array('success' => 'Y');

            if (!$_REQUEST['item_number']) {
                    $info['success'] = 'N';
                    $info['err'] = 'No item number provided';
            } else {
                    $query = 'SELECT * FROM items WHERE item_number="' . $_REQUEST['item_number'] . '" ';
                    $db->query($query, SQL_ALL);
                    if (count($db->record) > 0) {
                            $info['success'] = 'N';
                            $info['err'] = 'That item number is already being used.';
                    }
            }
            
            
            if (!$info['err'])  {

                    $clauses = array();
                    foreach ($fields as $f) {
                            $clauses[] = $f . '="' . $_REQUEST[$f] . '"';
                    }
                    $query = 'INSERT INTO items SET ' . implode(', ', $clauses);
                    $db->query($query, SQL_NONE);

                    if ($db->error) {
                            $info['success'] = 'N';
                            $info['err'] = '1 ' . $db->error;
                    } else {
                            $new_id = $db->getInsertId();
                            $info['scrollto'] = $new_id;
                            $tags = explode(', ', $_REQUEST['tags']);
                            $clauses = array();
                            foreach ($tags as $t) {
                                    if ($t) {
                                            $clauses[] = '(' . $new_id . ', "' . $t . '")';
                                    }
                            }

                            if (count($clauses) > 0) {
                                $query = 'INSERT INTO item_tags (item_id, name) VALUES ' . implode(', ', $clauses);
                                $db->query($query, SQL_NONE);
    
                                if ($db->error) {
                                        $info['success'] = 'N';
                                        $info['err'] = '2 ' . $db->error;
                                } 
                            }
                    }
            }

            echo json_encode($info);

    }
    
    if ($_REQUEST['action'] == 'get_tag_data') {
            $query = 'SELECT DISTINCT name from item_tags';
            $db->query($query, SQL_ALL);
            $tags = array();
            foreach ($db->record as $t) {
                    $tags[] = $t['name'];
            }
            echo json_encode(array('tags' => $tags));
    }

    return;
}
 */

?>