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
$insert_values.= "'".$_POST['ID_Pet']."'";
} 
if(isset($_POST['ID_Room'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "ID_Room";
$insert_values.= "'".$_POST['ID_Room']."'";
}
if(isset($_POST['ATEmployee'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "ATEmployee";
$insert_values.= "'".$_POST['ATEmployee']."'";
} 
if(isset($_POST['Date'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "Date";
$insert_values.= "'".$_POST['Date']."'";
} 
if(isset($_POST['Duration'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "Duration";
$insert_values.= "'".$_POST['Duration']."'";
}
if(isset($_POST['Type'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "Type";
$insert_values.= "'".$_POST['Type']."'";
} 

 

$sql_query = "INSERT INTO doactivity (".$insert_fields.") VALUES(".$insert_values.")";
mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));	

}
else{

//--------Επεξεργασία-------//
if ($input['action'] == 'edit') {
$update_field='';
if(isset($input['ID_Pet'])) {
$update_field.= "ID_Pet = '".$input['ID_Pet']."'";
} 
if(isset($input['ID_Room'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "ID_Room ='".$input['ID_Room']."'";
}
if(isset($input['ATEmployee'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "ATEmployee='".$input['ATEmployee']."'";
}
if(isset($input['Date'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "Date='".$input['Date']."'";
}  
if(isset($input['Duration'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "Duration='".$input['Duration']."'";
} 
if(isset($input['Type'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "Type='".$input['Type']."'";
}

if($update_field && $input['ID_Pet']) {
$sql_query = "UPDATE doactivity SET ".$update_field." WHERE ID_Pet ='". $input['ID_Pet'] ."' AND ID_Room ='". $input['ID_Room'] ."' AND ATEmployee ='". $input['ATEmployee'] ."'";
mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));
}
}

//---------Διαγραφή---------//
if ($input['action'] == 'delete') {
$string = $input['ALL'];
$arr = explode("/", $string);
$f = $arr[0];
$s = $arr[1];
$t = $arr[2];
$sql_query = "DELETE FROM `doactivity` WHERE `doactivity`.`ID_Pet` = '".$f."' AND `doactivity`.`ID_Room` = '".$s."'  AND `doactivity`.`ATEmployee` = '".$t."'";
mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));	
}

echo json_encode($input);
}
?>
