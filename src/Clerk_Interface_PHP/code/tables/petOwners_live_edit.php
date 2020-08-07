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
if(isset($_POST['ATOwner'])) {
$insert_fields.= "ATOwner";
$insert_values.= "'".$_POST['ATOwner']."'";
} 
if(isset($_POST['Visits'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "Visits";
$insert_values.= "'".$_POST['Visits']."'";
}
if(isset($_POST['FirstName'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "FirstName";
$insert_values.= "'".$_POST['FirstName']."'";
}
if(isset($_POST['LastName'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "LastName";
$insert_values.= "'".$_POST['LastName']."'";
} 
if(isset($_POST['AFM'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "AFM";
$insert_values.= "'".$_POST['AFM']."'";
} 
if(isset($_POST['PhoneNumber'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "PhoneNumber";
$insert_values.= "'".$_POST['PhoneNumber']."'";
} 
if(isset($_POST['Address'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "Address";
$insert_values.= "'".$_POST['Address']."'";
} 
if(isset($_POST['Email'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "Email";
$insert_values.= "'".$_POST['Email']."'";
} 
if(isset($_POST['Member'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "Member";
$insert_values.= "'".$_POST['Member']."'";
} 
 

$sql_query = "INSERT INTO petowner (".$insert_fields.") VALUES(".$insert_values.")";
mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));	

}
else{

//--------Επεξεργασία-------//
if ($input['action'] == 'edit') {
$update_field='';
if(isset($input['ATOwner'])) {
$update_field.= "ATOwner = '".$input['ATOwner']."'";
} 
if(isset($input['Visits'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "Visits ='".$input['Visits']."'";
}
if(isset($input['FirstName'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "FirstName='".$input['FirstName']."'";
} 
if(isset($input['LastName'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "LastName='".$input['LastName']."'";
}
if(isset($input['AFM'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "AFM='".$input['AFM']."'";
}
if(isset($input['PhoneNumber'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "PhoneNumber='".$input['PhoneNumber']."'";
}
if(isset($input['Address'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "Address='".$input['Address']."'";
}
if(isset($input['Email'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "Email='".$input['Email']."'";
}

if(isset($input['Member'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "Member=".$input['Member']."";
} 
 
if($update_field && $input['ATOwner']) {
$sql_query = "UPDATE petowner SET ".$update_field." WHERE ATOwner ='". $input['ATOwner'] ."'";
mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));
}
}

//---------Διαγραφή---------//
if ($input['action'] == 'delete') {
$sql_query = "DELETE FROM petowner WHERE ATOwner='" . $input['ATOwner'] . "'";
mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));	
}

echo json_encode($input);
}
?>
