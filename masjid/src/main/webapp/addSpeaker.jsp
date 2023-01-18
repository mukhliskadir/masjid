<!DOCTYPE html>
<html>
<head>

<body>

<!-----------------------------------NAVIGATION BAR------------------------------------------>

<%@include file="navbar.jsp"%>
<!------------------------------------------------------------------------------------------->

<div class="content">
    <br>
    <h2>PENCERAMAH</h2>

<!--------------------------------------FORM-------------------------------------------->

    <div class="custform">
        <form class="speaker" method="post" action="SpeakerServlet" id="form_id">
        
            <div class="dataa">
                <label>   Nama </label>
                <input type="text" name="speakerName" value="" id="name"  required oninvalid="this.setCustomValidity('Sila masukkan nama')" oninput="setCustomValidity('')">
            </div>
            
            <div class="dataa">
                <label>  No. Telefon</label>
                <input type="text" name="speakerPhone" value="" id="phone" placeholder="0123456790 tanpa (-)" pattern="^(\d{10}|\d{11})$" required oninvalid="this.setCustomValidity('Sila masukkan no. telefon')" oninput="setCustomValidity('')">
            </div>
            <div class="dataa">
                <label>    Pendidikan</label>
                <input type="text" name="speakerEdu" value="" id="education" required  oninvalid="this.setCustomValidity('Sila masukkan kelulusan penceramaha')" oninput="setCustomValidity('')">
            </div> 
            
            <!--SUBMIT  BUTTON -->
            <div id="mybutton" class="button">
                <button type="cancel" name="action"  value="cancel" formaction="SpeakerServlet" onclick="removeValidation()">BATAL</button>
                <input type="hidden" name="action" value="addSpeaker">
                <button type="submit" class="button button1" name="submit"  onclick="calAlert()" >TAMBAH</button><br><br>
            </div>
        </form>
    </div>
</div>
</body>
<script>
    function calAlert() {
        // Check if the name input field is valid
        if (!document.getElementById("name").checkValidity()) {
            alert("Sila masukkan nama");
            return;
        }
        // Check if the phone number input field is valid
        else if (!document.getElementById("phone").checkValidity()) {
            alert("Sila masukkan no telefon tanpa (-).");
            return;
        }
        else if (!document.getElementById("education").checkValidity()) {
            alert("Sila masukkan latarbelakang pendidikan");
            return;
        }
        else {
            // If both input fields are valid, show the confirmation dialog
            Swal.fire({
                title: 'Berjaya',
                text: 'Penceramah berjaya ditambah!',
                icon: 'success',
                showConfirmButton: false
             
            }).then((result) => {
                if (result.value) {
                    // If the user confirms, submit the form
                    document.getElementById("form_id").submit();
                }
            });
        }
    }
</script>
</html>