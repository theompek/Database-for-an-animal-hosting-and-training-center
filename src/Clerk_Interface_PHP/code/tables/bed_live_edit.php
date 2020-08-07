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
if(isset($_POST['ID_Bed'])) {
$insert_fields.= "ID_Bed";
$insert_values.= $_POST['ID_Bed'];
} 
if(isset($_POST['ID_Room'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "ID_Room";
$insert_values.= $_POST['ID_Room'];
}
if(isset($_POST['Species'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "Species";
$insert_values.= "'".$_POST['Species']."'";
} 
if(isset($_POST['Particularity'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "Particularity";
$insert_values.= "'".$_POST['Particularity']."'";
}
if(isset($_POST['Size'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "Size";
$insert_values.= "'".$_POST['Size']."'";
}
if(isset($_POST['Mattress'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "Mattress";
$insert_values.= "'".$_POST['Mattress']."'";
}

 

$sql_query = "INSERT INTO bed (".$insert_fields.") VALUES(".$insert_values.")";
mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));	

}
else{

//--------Επεξεργασία-------//
if ($input['action'] == 'edit') {
$update_field='';
if(isset($input['ID_Bed'])) {
$update_field.= "ID_Bed ='".$input['ID_Bed']."'";
} 
if(isset($input['ID_Room'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "ID_Room ='".$input['ID_Room']."'";
}
if(isset($input['Species'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "Species='".$input['Species']."'";
} 
if(isset($input['Particularity'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "Particularity='".$input['Particularity']."'";
} 

if(isset($input['Size'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "Size='".$input['Size']."'";
}

if(isset($input['Mattress'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "Mattress= ".$input['Mattress']."";
}


if($update_field && $input['ID_Bed']) {
$sql_query = "UPDATE bed SET ".$update_field." WHERE ID_Bed='" . $input['ID_Bed'] . "'";
mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));
}
}

//---------Διαγραφή---------//
if ($input['action'] == 'delete') {
$sql_query = "DELETE FROM bed WHERE ID_Bed='" . $input['ID_Bed'] . "'";
mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));	
}

echo json_encode($input);
}
?>
