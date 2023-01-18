<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
<body>

<!------------------------------DATABASE CONNECTION ----------------------------------------->
<%@include file="database.jsp"%>
<%@include file="navbar.jsp"%>



<% int id=Integer.parseInt(request.getParameter("id")); %>

<sql:query dataSource="${eschedule}" var="speaker">
	SELECT *
    FROM speaker
    WHERE speakerid = <%=id%>
</sql:query>

<!-----------------------------------NAVIGATION BAR------------------------------------------>
<!------------------------------------------------------------------------------------------->

<div class="content">
    <br>
    <h2>PENCERAMAH</h2>

<!---------------------------------------FORM------------------------------------------------->

    
<c:forEach var="data" items="${speaker.rows}">
 
    <div class="custform">
        <form class="speaker" method="post" action="SpeakerServlet" id="form_id">
            <input type="hidden" name="id" value='${data.speakerid}'/>
            <div class="dataa">
                <label>   Name </label>
                <input type="text" name="speakerName"  id="name" value='${data.speakername}' required>
            </div>
            <div class="dataa">
                <label>  Phone</label>
                <input type="text" name="speakerPhone"  id="phone" value='${data.speakerphoneno}'  pattern="^(\d{10}|\d{11})$" required >
            </div>
            <div class="dataa">
                <label>    Education</label>
                <input type="text" name="speakerEdu" value='${data.speakereducation}'>
            </div>

             <div id="mybutton" class="button">
                <button type="cancel" name="action"  value="cancel" formaction="SpeakerServlet">BATAL</button>
                <input type="hidden" name="action" value="updateSpeaker">
                <button type="button" formaction="SpeakerServlet"onclick="calAlert()">KEMASKINI</button>
                <br><br>
            </div>
        </form>
    </div>
</c:forEach>

<!------------------------------------------------------------------------------------------->

</div>
<script>function calAlert() {
	  if (!document.getElementById("phone").checkValidity()) {
          alert("Sila masukkan no telefon tanpa (-).");
          return;
      }
	  else if (!document.getElementById("name").checkValidity()) {
          alert("Sila masukkan nama");
          return;
      }

    Swal.fire({
        title: 'Kemaskini penceramah',
        text: 'Adakah anda pasti untuk mengemaskini penceramah ini?',
        icon: 'question',
        showCancelButton: true,
        cancelButtonText: 'BATAL',
        confirmButtonText: 'OK'

    }).then((result) => {
        if (result.value) {
            // If the user confirms, submit the form
            document.getElementById("form_id").submit();
        }
    })
}

</script>
</body>
</html>