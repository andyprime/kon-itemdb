<?php
require_once('db.php');
require_once('inc/functions.inc');
require_once('inc/instance.inc');

$db = $GLOBALS['db'] = new dbConnect($GLOBALS['instance']['app_name'], $GLOBALS['instance']['database']);

$month = date('M');
$year = date('y');

$month_full = date('F');
$year_full = date('Y');

if ($_REQUEST['do'] == 'idm') {
	include './ezpdf/class.ezpdf.php';

	// make a new pdf object
	$pdf = new Cezpdf();
	// select the font
	$pdf->selectFont('./ezpdf/fonts/Helvetica');
	
	$query = 'SELECT item_number, description FROM items ';
	$query .= 'WHERE type IN ("m", "p", "r") ';
	$query .= 'AND include_in_lists="y" ';
	$query .= 'ORDER BY item_number ';
	$db->query($query, SQL_ALL);
	$all = $db->record;

	$col1 = array();
	$col2 = array();
	$i = 1;
	foreach ($all as $item) {
		if ($i % 2 == 1) $col1[] = $item;
		else $col2[] = $item;
		$i++;
	}

	$data = array();
	for($i = 0; $i < count($col1); $i++) {
		$tmp = array();
		$tmp[] = $col1[$i]['item_number'];
		$tmp[] = $col1[$i]['description'];
		$tmp[] = '';
		$tmp[] = $col2[$i]['item_number'];
		$tmp[] = $col2[$i]['description'];
		$data[] = $tmp;
	}
	$cols = array(
	'Item #',
	'Description',
	'',
	'Item #',
	'Description'
	);
	$coloptions = array(
	array('width'=>25),
	array('width'=>200),
	array(),
	array('width'=>25),
	array('width'=>200)
	);
	$pdf->ezTable($data,$cols, 'Identify Magic Player Handout ' . $month_full . ' ' . $year_full, array('options'=>$coloptions));


	/*$colwidth = '200';

	$pdf->ezTable($col1,null, null, array('maxWidth'=>$colwidth, 'xOrientation'=>'left'));
	$pdf->ezSetY(792);
	$pdf->ezTable($col2,null, null, array('maxWidth'=>$colwidth, 'xOrientation'=>'right'));*/

	$pdf->stream(array('Content-Disposition'=>'idmagic-' . $month . '-' . $year . '.pdf'));
} elseif ($_REQUEST['do'] == 'ev') {
	include './ezpdf/class.ezpdf.php';

	// make a new pdf object
	$pdf = new Cezpdf();
	// select the font
	$pdf->selectFont('./ezpdf/fonts/Helvetica');


	$query = 'SELECT item_number, description, value FROM items ';
	$query .= 'WHERE type="t" ';
	$query .= 'AND include_in_lists="y" ';
	$query .= 'ORDER BY item_number ';
	$db->query($query, SQL_ALL);
	$all = $db->record;

	$col1 = array();
	$col2 = array();
	$i = 1;
	foreach ($all as $item) {
		if ($i % 2 == 1) $col1[] = $item;
		else $col2[] = $item;
		$i++;
	}

	$data = array();
	for($i = 0; $i < count($col1); $i++) {
		$tmp = array();
		$tmp[] = $col1[$i]['item_number'];
		$tmp[] = $col1[$i]['description'];
		$tmp[] = $col1[$i]['value'];
		$tmp[] = '';
		$tmp[] = $col2[$i]['item_number'];
		$tmp[] = $col2[$i]['description'];
		$tmp[] = $col2[$i]['value'];
		$data[] = $tmp;
	}
	$cols = array(
		'Item #',
		'Description',
		'Value',
		'',
		'Item #',
		'Description',
		'Value'
	);
	$coloptions = array(
		array('width'=>25),
		array('width'=>195),
		array('width'=>30),
		array(),
		array('width'=>25),
		array('width'=>195),
		array('width'=>30)
	);
	$pdf->ezTable($data,$cols, 'Estimate Value Player Handout ' . $month_full . ' ' . $year_full, array('options'=>$coloptions));

	/*$colwidth = '200';

	$pdf->ezTable($col1,null, null, array('maxWidth'=>$colwidth, 'xOrientation'=>'left'));
	$pdf->ezSetY(792);
	$pdf->ezTable($col2,null, null, array('maxWidth'=>$colwidth, 'xOrientation'=>'right'));*/

	$pdf->stream(array('Content-Disposition'=>'estimatevalue-' . $month . '-' . $year . '.pdf'));
} elseif ($_REQUEST['do'] == 'mstr') {
	include './ezpdf/class.ezpdf.php';

	// make a new pdf object
	$pdf = new Cezpdf();
	// select the font
	$pdf->selectFont('./ezpdf/fonts/Helvetica');
	
	$query = 'SELECT item_number, description FROM items ';
	$query .= 'WHERE type IN ("m", "p", "r") ';
	$query .= 'ORDER BY item_number ';
	$db->query($query, SQL_ALL);
	$all = $db->record;

	$col1 = array();
	$col2 = array();
	$i = 1;
	foreach ($all as $item) {
		if ($i % 2 == 1) $col1[] = $item;
		else $col2[] = $item;
		$i++;
	}

	$data = array();
	for($i = 0; $i < count($col1); $i++) {
		$tmp = array();
		$tmp[] = $col1[$i]['item_number'];
		$tmp[] = $col1[$i]['description'];
		$tmp[] = '';
		$tmp[] = $col2[$i]['item_number'];
		$tmp[] = $col2[$i]['description'];
		$data[] = $tmp;
	}
	$cols = array(
	'Item #',
	'Description',
	'',
	'Item #',
	'Description'
	);
	$coloptions = array(
	array('width'=>25),
	array('width'=>200),
	array(),
	array('width'=>25),
	array('width'=>200)
	);
	$pdf->ezTable($data,$cols, 'Identify Magic Master List ' . $month_full . ' ' . $year_full, array('options'=>$coloptions));


	/*$colwidth = '200';

	$pdf->ezTable($col1,null, null, array('maxWidth'=>$colwidth, 'xOrientation'=>'left'));
	$pdf->ezSetY(792);
	$pdf->ezTable($col2,null, null, array('maxWidth'=>$colwidth, 'xOrientation'=>'right'));*/

	$pdf->stream(array('Content-Disposition'=>'master-' . $month . '-' . $year . '.pdf'));
}

include('inc/header.inc');
?>
<br />

You seem to have somehow forgotten to specify which file you wanted to make.

<br /><br />
<form>
<input type="hidden" name="do" value="idm" />
<input type="submit" value="Make Identify Magic List" />
</form>

<form>
<input type="hidden" name="do" value="ev" />
<input type="submit" value="Make Estimate Value List" />
</form>
</html>