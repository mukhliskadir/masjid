<!DOCTYPE html>
<html>
<body>

<!-----------------------------------NAVIGATION BAR------------------------------------------>

<%@include file="navbar.jsp"%>

<!------------------------------------------------------------------------------------------->

<div class="content">
			
	<br>
	<h2>PENGUMUMAN</h2>
	
<!--------------------------------------FORM-------------------------------------------->
	
	<div class="ANNOUNCEMENTFORM">
		<form class="announcement" method="post"  action="AnnouncementServlet" enctype="multipart/form-data">
			<div class="dataa">
				<label> Poster </label>
				<input type="file" name="aPicture" id="file" onchange="loadFile(event)"> </div>
			<div class="dataa">
				<label> Topik </label>
				<input type="text" name="aTitle" value="" id="title"required> </div>
			<div class="dataa">
				<label> Tarikh</label>
				<input type="date" name="aDate" value="" id="date"required> </div>
			<div class="dataa">
				<label> Masa</label>
			<input type="time" name="aTime" value=""> </div>
			<div class="dataa">
				<label> Deskripsi</label>
				<textarea name="aDesc" style="height:200px;"></textarea>
			</div>
			<!--SUBMIT  BUTTON -->
			<div id="mybutton" class="button">
				<input type="hidden" name="action" value="addAnnouncement">
				<button type="submit" class="button button1" name="submit" onclick="calAlert()">TAMBAH</button>
				<br>
				<br> </div>
		</form>
	</div>

<!-----------------------------------DISPLAY IMAGE------------------------------------------->

	<div class="ANNOUNCEMENTFORM">
		<div class="divposter">
			<div class="dataa">
				<p><img id="output" style="height:400px;" /></p>
			</div>
		</div>
	</div>

<!------------------------------------------------------------------------------------------->
	
</div>
</body>
<script>
function calAlert() {
    // Check if the name input field is valid
    if (!document.getElementById("title").checkValidity()) {
        alert("Sila masukkan topik");
        return;
    }
    // Check if the phone number input field is valid
    else if (!document.getElementById("date").checkValidity()) {
        alert("Sila masukkan tarikh");
        return;
    }
    else {
        // If both input fields are valid, show the confirmation dialog
        Swal.fire({
            title: 'Berjaya',
            text: 'Pengumuman berjaya ditambah!',
            icon: 'success',
         
        }).then((result) => {
            if (result.value) {
                // If the user confirms, submit the form
                document.getElementById("form_id").submit();
            }
        });
    }
}</script>

</html>