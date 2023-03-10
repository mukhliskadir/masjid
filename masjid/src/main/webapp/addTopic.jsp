<!DOCTYPE html>
<html>
<body>

<!-----------------------------------NAVIGATION BAR------------------------------------------>

<%@include file="navbar.jsp"%>
<!------------------------------------------------------------------------------------------->

<div class="content">
    <br>
    <h2>TAJUK</h2>

<!--------------------------------------FORM-------------------------------------------->

    <div class="topicform">
        <form class="speaker" method="post" action="TopicServlet" id="form_id">
            <div class="dataa">
                <label>   Tajuk </label>
                <input type="text" name="topicName" value="" id="topic" required oninvalid="this.setCustomValidity('Sila masukkan nama tajuk')" oninput="setCustomValidity('')">
            </div>
            <div class="dataa">
                <label> Tema</label>
                <select name="topicTheme" id="theme" required   oninvalid="this.setCustomValidity('Sila masukkan tema')" oninput="setCustomValidity('')">
                    <option value="" disabled selected hidden>Pilih Tema...</option>
                    <option value="Sirah">Sirah</option>
                    <option value="Akhlak">Akhlak</option>
                    <option value="Fiqh">Fiqh</option>
                    <option value="Tafsir">Tafsir</option>
                    <option value="Akidah">Akidah</option>
                    <option value="Lain-lain">Lain-lain</option>
                    
                </select>
            </div>
            <div id="mybutton" class="button">
                <button type="cancel" name="action"  value="cancel" formaction="TopicServlet" onclick="removeValidation()">BATAL</button>
                <input type="hidden" name="action" value="addTopic">
                <button type="submit" class="button button1"  value="addTopic" name="submit" onclick="calAlert()" >TAMBAH</button><br><br>
            </div>
        </form>
    </div>
</div>
<br><br><br>
</body>
<script>
function removeValidation() {
    let elements = document.getElementsByTagName("select");
    for(let i = 0; i < elements.length; i++) {
        elements[i].required = false;
    }
    let element = document.getElementsByTagName("input");
    for(let i = 0; i < element.length; i++) {
        element[i].required = false;
    }
}
function calAlert() {
	 if  (!document.getElementById("topic").checkValidity()) {
	        alert("Sila masukkan tajuk");
	        return;
}
	  else if (!document.getElementById("theme").checkValidity()) {
	        alert("Sila masukkan tema");
	        return;
}
	  else
  Swal.fire({
      title: 'Berjaya',
      text: 'Tajuk telah ditambah!',
      icon: 'success',
      showConfirmButton: false

  }).then((result) => {
      if (result.value) {
          // If the user confirms, submit the form
          document.getElementById("form_id").submit();
      }
  })
}

   
    </script>
</html>