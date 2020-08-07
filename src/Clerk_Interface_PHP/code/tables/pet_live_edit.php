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
if(isset($_POST['Breed'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "Breed";
$insert_values.= "'".$_POST['Breed']."'";
}
if(isset($_POST['Name'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "Name";
$insert_values.= "'".$_POST['Name']."'";
} 
if(isset($_POST['Species'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "Species";
$insert_values.= "'".$_POST['Species']."'";
} 
if(isset($_POST['Age'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "Age";
$insert_values.= "'".$_POST['Age']."'";
}
if(isset($_POST['Weight'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "Weight";
$insert_values.= "'".$_POST['Weight']."'";
} 
if(isset($_POST['Color'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "Color";
$insert_values.= "'".$_POST['Color']."'";
} 
if(isset($_POST['ID_Bed'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "ID_Bed";
$insert_values.= "'".$_POST['ID_Bed']."'";
} 
if(isset($_POST['ATOwner'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "ATOwner";
$insert_values.= "'".$_POST['ATOwner']."'";
} 

if(isset($_POST['Sterilization'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "Sterilization";
$insert_values.= "'".$_POST['Sterilization']."'";
} 
 

$sql_query = "INSERT INTO pet (".$insert_fields.") VALUES(".$insert_values.")";
mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));	

}
else{

//--------Επεξεργασία-------//
if ($input['action'] == 'edit') {
$update_field='';
if(isset($input['ID_Pet'])) {
$update_field.= "ID_Pet = '".$input['ID_Pet']."'";
} 
if(isset($input['Breed'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "Breed ='".$input['Breed']."'";
}
if(isset($input['Name'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "Name='".$input['Name']."'";
}
if(isset($input['Species'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "Species='".$input['Species']."'";
}  
if(isset($input['Age'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "Age='".$input['Age']."'";
} 
if(isset($input['Weight'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "Weight='".$input['Weight']."'";
}
if(isset($input['Color'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "Color='".$input['Color']."'";
}
if(isset($input['ID_Bed'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "ID_Bed='".$input['ID_Bed']."'";
}
if(isset($input['ATOwner'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "ATOwner='".$input['ATOwner']."'";
}

if(isset($input['Sterilization'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "Sterilization=".$input['Sterilization']."";
} 
 
if($update_field && $input['ID_Pet']) {
$sql_query = "UPDATE pet SET ".$update_field." WHERE ID_Pet ='". $input['ID_Pet'] ."'";
mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));
}
}

//---------Διαγραφή---------//
if ($input['action'] == 'delete') {
$sql_query = "DELETE FROM pet WHERE ID_Pet='" . $input['ID_Pet'] . "'";
mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));	
}

echo json_encode($input);
}
?>
