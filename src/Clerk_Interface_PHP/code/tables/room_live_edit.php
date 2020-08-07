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
if(isset($_POST['ID_Room'])) {
$insert_fields.= "ID_Room";
$insert_values.= "'".$_POST['ID_Room']."'";
} 
if(isset($_POST['MaxNumOfPets'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "MaxNumOfPets";
$insert_values.= "'".$_POST['MaxNumOfPets']."'";
}
if(isset($_POST['SpaceType'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "SpaceType";
$insert_values.= "'".$_POST['SpaceType']."'";
} 
if(isset($_POST['RoomName'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "RoomName";
$insert_values.= "'".$_POST['RoomName']."'";
} 


$sql_query = "INSERT INTO room (".$insert_fields.") VALUES(".$insert_values.")";
mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));	

}
else{

//--------Επεξεργασία-------//
if ($input['action'] == 'edit') {
$update_field='';
if(isset($input['ID_Room'])) {
$update_field.= "ID_Room = '".$input['ID_Room']."'";
} 
if(isset($input['MaxNumOfPets'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "MaxNumOfPets ='".$input['MaxNumOfPets']."'";
}
if(isset($input['SpaceType'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "SpaceType='".$input['SpaceType']."'";
}
if(isset($input['RoomName'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "RoomName='".$input['RoomName']."'";
}  

 
if($update_field && $input['ID_Room']) {
$sql_query = "UPDATE room SET ".$update_field." WHERE ID_Room ='". $input['ID_Room'] ."'";
mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));
}
}

//---------Διαγραφή---------//
if ($input['action'] == 'delete') {
$sql_query = "DELETE FROM room WHERE ID_Room='" . $input['ID_Room'] . "'";
mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));	
}

echo json_encode($input);
}
?>
