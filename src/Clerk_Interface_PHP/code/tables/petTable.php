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
		<h3 style="text-align: center;" >Table Pet</h3>
	</div>

    <p class="text">Συμπληρώστε τα παρακάτω πεδία και πατήστε <span>SUBMIT</span> για να εισάγετε στοιχεία στην βάση.</p>
	
<div class="formStyle">
		<form class="form-inline" onsubmit="pageReload();" action="pet_live_edit.php" method="post" target="dummyframe">

				<input type="number" name="ID_Pet" id="ID_Pet" placeholder="ID_Pet" required>
				<input type="text" name="Breed" id="Breed" placeholder="Breed" >
				<input type="text" name="Name" id="Name" placeholder="Name">
				<input list="Species" name="Species" placeholder="Species">				
				<datalist id="Species">
					<option value="Dog"></option>
					<option value="Cat"></option>
				 </datalist>
				<input type="number" name="Age" id="Age" placeholder="Age" >
				<input type="number" name="Weight" id="Weight" placeholder="Weight">
				<input type="text" name="Color" id="Color" placeholder="Color" >
				<input type="number" name="ID_Bed" id="ID_Bed" placeholder="ID_Bed" required>
				<input type="text" name="ATOwner" id="ATOwner" placeholder="ATOwner" required>
				<input list="Sterilization" name="Sterilization" placeholder="Sterilization">
				  <datalist id="Sterilization">
					<option value="NO"></option>
					<option value="YES"></option>
				 </datalist>
				
			<button type="submit" name="insert" value="Submit">SUBMIT</button>
		</form>
	<input type="button" value="Refresh Table" onClick="pageReload();">

		<table style="width:100%;" id="data_table" class="table table-striped">
			<thead>
			<tr>
			<th>ID_Pet</th>
			<th>Breed</th>
			<th>Name</th>
			<th>Species</th>
			<th>Age</th>
			<th>Weight</th>
			<th>Color</th>
			<th>ID_Bed</th>
			<th>ATOwner</th>
			<th>Sterilization</th>
			<th></th>
			
			</tr>
			</thead>
			<tbody>
			<?php
			include_once("db_connect.php");
			$sql_query = "SELECT ID_Pet,Breed,Name,Species,Age,Weight,Color,ID_Bed,ATOwner,Sterilization FROM pet";
			$resultset = mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));
			while( $data = mysqli_fetch_assoc($resultset) ) {
			?>
			<tr id="<?php echo $data ['ID_Pet']; ?>">
			<td><?php echo $data ['ID_Pet']; ?></td>
			<td><?php echo $data ['Breed']; ?></td>
			<td><?php echo $data ['Name']; ?></td>
			<td><?php echo $data ['Species']; ?></td>
			<td><?php echo $data ['Age']; ?></td>
			<td><?php echo $data ['Weight']; ?></td>
			<td><?php echo $data ['Color']; ?></td>
			<td><?php echo $data ['ID_Bed']; ?></td>
			<td><?php echo $data ['ATOwner']; ?></td>
			<td><?php echo $data ['Sterilization']; ?></td>
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
url: 'pet_live_edit.php',
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
	
	identifier: [0, 'ID_Pet'],
	editable: [[1, 'Breed'], [2, 'Name'], [3,'Species'], [4,'Age'],[ 5,'Weight'], [6,'Color'], [7,'ID_Bed'], [8,'ATOwner'], [9,'Sterilization','{"1": "YES", "2": "NO"}']]
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