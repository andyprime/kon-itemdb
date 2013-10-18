<?php
/*
*  Andrew's PHP database connection manager
*  Version 1.01
*/

/*
*  OPTIONS
*  ---------------------
* 
*  - $error_html (as of 1.01)
*		The html displayed when the constructor encounters an error.
*		Any occurance of the string %%error% in this field will be replaced with the error message generated.
*/



/*
*  VERSION HISTORY
*  ---------------------
*
*  1.01
*	- Added a standard error message alert when an error occurs connecting to the database, selecting a database, 
*	  or getting info from the pw file
*
*  1.0
*	- Added version history
*/



// define values for result format
define('SQL_NONE', 1); // does not bother with results
define('SQL_ALL', 2); // puts all returned rows into an array
define('SQL_INIT', 3); // returns just an array for the first returned row

// define the query formats, i.e. wether it will use mysql_fetch_ assoc or index
define('SQL_ASSOC', 1);
define('SQL_INDEX', 2);

class dbConnect {
	var $db, $result, $error, $record;

	var $error_html = '
	<div style="margin: 10px auto; width: 600px; border: 1px solid red;">
	<div style="width: 594px; background-color: red; color: white; font-weight: bold; padding: 3px; text-align: center;">AN ERROR HAS OCCURED!</div>
	<div style="width: 100%; padding: 11px;">This application could not connect to the database properly, please alert the administration.<br /><br />Error message: %%error%%
	</div></div>';

	function dbConnect($app_name, $database) {
		if (!is_file($GLOBALS['instance']['password_file'])) $err = 'Specified password file does not exist.';

		if (!$err) {
			require_once($GLOBALS['instance']['password_file']);

			if (!is_array($_PASSWD)) $err = 'Password file did not contain password definitions.';
			if (!is_array($_PASSWD[$app_name])) $err = 'Password file did not contain an entry for the specified application.';

			if (!$err) {
				$host = $_PASSWD[$app_name]['host'];
				$login = $_PASSWD[$app_name]['user'];
				$pass = $_PASSWD[$app_name]['password'];
				unset($_PASSWD);
				$this->db = mysql_connect($host, $login, $pass);

				$err = mysql_error();

				if (!$err) {
					mysql_select_db($database, $this->db);
					$err = mysql_error();
				}
			}
		}

		if ($err) {
			echo str_replace('%%error%%', $err, $this->error_html);
			exit;
		}

	}

	function disconnect() {
		mysql_close($this->db);
	}

	function query($sql_query, $type = SQL_NONE, $format = SQL_INDEX) {
		unset($this->error);

		$this->record = array();
		$_data = array();

		$this->result = mysql_query($sql_query, $this->db);

		if ($this->error = mysql_error($this->db)) return false;
		switch ($type) {
			case SQL_ALL:
				// get all the records
				while ($_row = mysql_fetch_assoc($this->result)) $_data[] = $_row;
				mysql_free_result($this->result);
				$this->record = $_data;
				break;
			case SQL_INIT:
				// get the first record
				$this->record = mysql_fetch_assoc($this->result);
				break;
			case SQL_NONE:
			default:
				// records will be looped over with next()
				break;
		}
		return true;
	}

	function next($format = SQL_INDEX) {
		if ($this->record = mysql_fetch_assoc($this->result)) {
			return true;
		} else {
			$this->result->free();
			return false;
		}

	}

	function getInsertId() {
		return mysql_insert_id($this->db);
	}

	function isError() {
		return $this->error;
	}

	function getError() {
		return $this->error;
	}
}
?>