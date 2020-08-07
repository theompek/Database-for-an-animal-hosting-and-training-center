<?php
include_once("db_connect.php");

if ($_SERVER['REQUEST_METHOD']=='POST') {
  $input = filter_input_array(INPUT_POST);
} else {
  $input = filter_input_array(INPUT_GET);
}

//-------Εισαγωγή-----------//
if ($_SERVER['REQUEST_METHOD'] == "POST" and isset($_POST['insert'])) {	
$insert_values="";
$insert_fields="";
if(isset($_POST['ID_Pet'])) {
$insert_fields.= "ID_Pet";
$insert_values .= "'".$_POST['ID_Pet']."'";
} 

if(isset($_POST['ATEmployee'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "ATEmployee";
$insert_values.= preg_replace('/\s+/', '', str_replace(' ', '', "'".$_POST['ATEmployee']."'"));
} 
 

$sql_query = "INSERT INTO takecareof (".$insert_fields.") VALUES(".$insert_values.")";
mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));	

}
else{


//---------Διαγραφή---------//
if ($input['action'] == 'delete') {
$string = $input['ALL'];
$arr = explode("/", $string);
$f = $arr[0];
$s = $arr[1];
$sql_query = "DELETE FROM `takecareof` WHERE `takecareof`.`ID_Pet` = '".$f."' AND `takecareof`.`ATEmployee` = '".$s."'";
mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));	
}

echo json_encode($input);
}
?>
