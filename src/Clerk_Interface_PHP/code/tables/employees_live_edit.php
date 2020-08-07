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
if(isset($_POST['ATEmployee'])) {
$insert_fields.= "ATEmployee";
$insert_values.= "'".$_POST['ATEmployee']."'";
} 
if(isset($_POST['Job'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "Job";
$insert_values.= "'".$_POST['Job']."'";
}
if(isset($_POST['YearsOfExperience'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "YearsOfExperience";
$insert_values.= "'".$_POST['YearsOfExperience']."'";
} 
if(isset($_POST['Specialization'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "Specialization";
$insert_values.= "'".$_POST['Specialization']."'";
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
if(isset($_POST['Availability'])) {
if($insert_values != ''){$insert_values.= ', '; $insert_fields.= ', ';}
$insert_fields.= "Availability";
$insert_values.= "'".$_POST['Availability']."'";
} 
 

$sql_query = "INSERT INTO employee (".$insert_fields.") VALUES(".$insert_values.")";
mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));	

}
else{

//--------Επεξεργασία-------//
if ($input['action'] == 'edit') {
$update_field='';
if(isset($input['ATEmployee'])) {
$update_field.= "ATEmployee = '".$input['ATEmployee']."'";
} 
if(isset($input['Job'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "Job ='".$input['Job']."'";
}
if(isset($input['YearsOfExperience'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "YearsOfExperience='".$input['YearsOfExperience']."'";
}
if(isset($input['Specialization'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "Specialization='".$input['Specialization']."'";
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

if(isset($input['Availability'])) {
if($update_field != ''){$update_field.= ', ';}	
$update_field.= "Availability=".$input['Availability']."";
} 
 
if($update_field && $input['ATEmployee']) {
$sql_query = "UPDATE employee SET ".$update_field." WHERE ATEmployee ='". $input['ATEmployee'] ."'";
mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));
}
}

//---------Διαγραφή---------//
if ($input['action'] == 'delete') {
$sql_query = "DELETE FROM employee WHERE ATEmployee='" . $input['ATEmployee'] . "'";
mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));	
}

echo json_encode($input);
}
?>
