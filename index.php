<?php
require_once './vendor/autoload.php';
use PhpZip\ZipFile;
$mysqlHostName = "localhost";
$DbName = [
	'swim_investmentmatrix' => [
		'username' => 'swim_matrix',
		'password' => 'cF3RB9NZPs'
	],
	'swim_offtheblocks' => [
		'username' => 'swim_otb',
		'password' => 'rN^,oV&AQ{B#'
	],
	'swim_central' => [
		'username' => 'swim_central',
		'password' => 'MQYO}KCLu5!0'
	],
	'swim_charEQter' => [
		'username' => 'swim_charEQter',
		'password' => 'qK6ZgbsHSiZNVXG'
	],
	'swim_divingiap' => [
		'username' => 'swim_diving',
		'password' => 'Sp0rtP4rk'
	],
	'swim_swimdb' => [
		'username' => 'swim_swim1',
		'password' => 'Sw1mtest5'
	]
];
$backupFolder = __DIR__ . '/backups/' . date('Y-m-d');
if (!is_dir($backupFolder)) {
	mkdir($backupFolder, 0777, true);
}
$i = 0;
foreach ($DbName as $exp_db_name => $details) {
	$conn = mysqli_connect($mysqlHostName, $details['username'], $details['password'], $exp_db_name);
	if (!$conn) {
		die("Connection failed: " . mysqli_connect_error());
	}
	$backup_name = $exp_db_name . '.sql';
	$path = $backupFolder . '/' . $backup_name;
	db_dump($mysqlHostName, $details['username'], $details['password'], $exp_db_name, false, $path);
	$i++;
}
$totaldbs = count($DbName);
if ($i == $totaldbs) {
	$zipFilename = 'backup_' . date('Y-m-d') . '.zip';
	$zipPath = __DIR__ . '/' . $zipFilename;
	$pathdir = __DIR__ . '/backups/' . date('Y-m-d') . '/';
	if (zip($pathdir, $zipPath)) {
		header('Content-Type: application/zip');
		header('Content-Disposition: attachment; filename="' . $zipFilename . '"');
		header('Content-Length: ' . filesize($zipPath));
		readfile($zipPath);
		unlink($zipPath);
		deleteFolder($backupFolder);
	}
}
function zip($pathdir, $zipcreated)
{
	$sourceDir = $pathdir;
	$zipFolder = $zipcreated;
	$folderName = basename($sourceDir);
	$zipFile = $zipFolder;
	$zip = new ZipFile();
	try {
		$zip
			->addDir($sourceDir, $folderName)
			->saveAsFile($zipFile)
			->close();
		return true;
	} catch (\PhpZip\Exception\ZipException $e) {
		return false;
	} finally {
		$zip->close();
	}
}
function deleteFolder($folderPath)
{
	if (is_dir($folderPath)) {
		$files = glob($folderPath . '/*');
		foreach ($files as $file) {
			if (is_file($file)) {
				unlink($file);
			} elseif (is_dir($file)) {
				deleteFolder($file);
			}
		}
		rmdir($folderPath);
		return true;
	} else {
		return false;
	}
}
function db_dump($host, $user, $pass, $name,  $tables = false, $path)
{
	$mysqli = new mysqli($host, $user, $pass, $name);
	$mysqli->select_db($name);
	$mysqli->query("SET NAMES 'utf8'");
	$queryTables    = $mysqli->query('SHOW TABLES');
	while ($row = $queryTables->fetch_row()) {
		$target_tables[] = $row[0];
	}
	if ($tables !== false) {
		$target_tables = array_intersect($target_tables, $tables);
	}
	foreach ($target_tables as $table) {
		$result         =   $mysqli->query('SELECT * FROM ' . $table);
		$fields_amount  =   $result->field_count;
		$rows_num = $mysqli->affected_rows;
		$res            =   $mysqli->query('SHOW CREATE TABLE ' . $table);
		$TableMLine     =   $res->fetch_row();
		$content        = (!isset($content) ?  '' : $content) . "\n\n" . $TableMLine[1] . ";\n\n";
		for ($i = 0, $st_counter = 0; $i < $fields_amount; $i++, $st_counter = 0) {
			while ($row = $result->fetch_row()) { //when started (and every after 100 command cycle):
				if ($st_counter % 100 == 0 || $st_counter == 0) {
					$content .= "\nINSERT INTO " . $table . " VALUES";
				}
				$content .= "\n(";
				for ($j = 0; $j < $fields_amount; $j++) {
					$row[$j] = str_replace("\n", "\\n", addslashes($row[$j]));
					if (isset($row[$j])) {
						$content .= '"' . $row[$j] . '"';
					} else {
						$content .= '""';
					}
					if ($j < ($fields_amount - 1)) {
						$content .= ',';
					}
				}
				$content .= ")";
				if ((($st_counter + 1) % 100 == 0 && $st_counter != 0) || $st_counter + 1 == $rows_num) {
					$content .= ";";
				} else {
					$content .= ",";
				}
				$st_counter = $st_counter + 1;
			}
		}
		$content .= "\n\n\n";
	}
	file_put_contents($path, $content);
}
