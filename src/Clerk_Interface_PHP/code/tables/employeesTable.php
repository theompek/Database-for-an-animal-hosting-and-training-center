<html>
<head>
<title></title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.tabledit.js"></script>
<script type="text/javascript" src="../js/jquery.tabledit.min.js"></script>
<!-- Bootstrap themes CSS for style -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="../css/tablesStyle.css" />

</head>

<body style="zoom:75%;">
	<div class="header1">
		<h3 style="text-align: center;" >Table Employees</h3>
	</div>

    <p class="text">Συμπληρώστε τα παρακάτω πεδία και πατήστε <span>SUBMIT</span> για να εισάγετε στοιχεία στην βάση.</p>
	
<div class="formStyle">
		<form class="form-inline" onsubmit="pageReload();" action="employees_live_edit.php" method="post" target="dummyframe">

				<input type="text" name="ATEmployee" id="ATEmployee" placeholder="ATEmployee" required>
				<input type="text" name="Job" id="Job" placeholder="Job" required>
				<input type="number" name="YearsOfExperience" id="YearsOfExperience" placeholder="YearsOfExperience">
				<input type="text" name="Specialization" id="Specialization" placeholder="Specialization">
				<input type="text" name="FirstName" id="FirstName" placeholder="FirstName" required>
				<input type="text" name="LastName" id="LastName" placeholder="LastName">
				<input type="text" name="AFM" id="AFM" placeholder="AFM" required>
				<input type="text" name="PhoneNumber" id="PhoneNumber" placeholder="PhoneNumber" required>
				<input type="text" name="Address" id="Address" placeholder="Address">
				<input type="text" name="Email" id="Email" placeholder="Email">
				<input list="Availability" name="Availability" placeholder="Availability">
				  <datalist id="Availability">
					<option value="NO"></option>
					<option value="YES"></option>
				 </datalist>
				
			<button type="submit" name="insert" value="Submit">SUBMIT</button>
		</form>
	<input type="button" value="Refresh Table" onClick="pageReload();">

		<table style="width:100%;" id="data_table" class="table table-striped">
			<thead>
			<tr>
			<th>ATEmployee</th>
			<th>Job</th>
			<th>YearsOfExperience</th>
			<th>Specialization</th>
			<th>FirstName</th>
			<th>LastName</th>
			<th>AFM</th>
			<th>PhoneNumber</th>
			<th>Address</th>
			<th>Email</th>
			<th>Availability</th>
			<th></th>
			
			</tr>
			</thead>
			<tbody>
			<?php
			include_once("db_connect.php");
			$sql_query = "SELECT ATEmployee,Job,YearsOfExperience,Specialization,FirstName,LastName,AFM,PhoneNumber,Address,Email,Availability FROM employee";
			$resultset = mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));
			while( $data = mysqli_fetch_assoc($resultset) ) {
			?>
			<tr id="<?php echo $data ['ATEmployee']; ?>">
			<td><?php echo $data ['ATEmployee']; ?></td>
			<td><?php echo $data ['Job']; ?></td>
			<td><?php echo $data ['YearsOfExperience']; ?></td>
			<td><?php echo $data ['Specialization']; ?></td>
			<td><?php echo $data ['FirstName']; ?></td>
			<td><?php echo $data ['LastName']; ?></td>
			<td><?php echo $data ['AFM']; ?></td>
			<td><?php echo $data ['PhoneNumber']; ?></td>
			<td><?php echo $data ['Address']; ?></td>
			<td><?php echo $data ['Email']; ?></td>
			<td><?php echo $data ['Availability']; ?></td>
			</tr>
			<?php } ?>
			</tbody>
		</table>
</div>
<script>
function pageReload() {
 setTimeout(function() {
    location.reload();
}, 300);
}

function tempAlert(msg,duration)
{
 var el = document.createElement("div");
 el.setAttribute("style"," width:270px;border-radius:15px;position:fixed;top:5%;left:35%;background-color:LightCoral;font-size:200%;");
 el.innerHTML = msg;
 setTimeout(function(){
  el.parentNode.removeChild(el);
 },duration);
 document.body.appendChild(el);
}

$(document).ready(function(){
$('#data_table').Tabledit({
url: 'employees_live_edit.php',
    saveButton: true,
    autoFocus: false,
	restoreButton:false,
    buttons: {
        edit: {
            class: 'btn btn-sm btn-primary',
            html: '<span class="glyphicon glyphicon-pencil"></span> &nbsp EDIT',
            action: 'edit'
        },
        delete: {
            class: 'btn btn-sm btn-danger',
            html: '<span class="glyphicon glyphicon-trash"></span> &nbsp DELETE',
            
        },
        confirm: {
            class: 'btn btn-sm btn-default',
            html: '<span style="color:green;" class="glyphicon glyphicon-ok"></span> &nbsp  Πατήστε για<br> επιβεβαίωση διαγραφής',
			action: 'delete'
        },
		save: {
		class: 'btn btn-sm btn-success',
		html: 'Save'
		}

    },
columns: {
	
	identifier: [0, 'ATEmployee'],
	editable: [[1, 'Job'], [2, 'YearsOfExperience'], [3,'Specialization'], [4,'FirstName'],[ 5,'LastName'], [6,'AFM'], [7,'PhoneNumber'], [8,'Address'], [9,'Email'], [10,'Availability','{"1": "YES", "2": "NO"}']]
	},
  onSuccess:function(data, textStatus, jqXHR)
          {
			  console.log(data);
        console.log(textStatus);
        console.log(jqXHR.readyState);
           if(data.action == 'delete')
           {
			tempAlert("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MESSAGE <br> &nbsp; Row was deleted  !!",3000);
           }
          }
         ,
		 onFail: function (jqXHR, textStatus, errorThrown) {
			alert('Η αλλαγή που κάνατε είναι μη αποδεκτή, παρακαλώ ελέγξτε τον τύπος των δεδομένων σε περίπτωση εισαγωγής ή αλλαγής στοιχείων του πίνακα ,ενώ σε περίπτωση διαγραφής τα δεδομένα που προσπαθείται να διαγράψετε είναι δεδομένα που ανοίκουν σε άλλον πίνακα(foreign keys)');
		
		}
	 
});
});
</script>

<!-- Ena iframe mhdenikwn diastasewn gia na apofhgoume to redirect apo to action ths parakatw formas-->
<iframe width="0" height="0" border="0" name="dummyframe" id="dummyframe"></iframe>
</body>

</html>