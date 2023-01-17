<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
<body>
  	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!------------------------------DATABASE CONNECTION ----------------------------------------->

<%@include file="database.jsp"%>


<% int id=Integer.parseInt(request.getParameter("id")); %>
<sql:query dataSource="${eschedule}" var="speaker">
	SELECT *
    FROM topic
    WHERE topicid = <%=id%>
</sql:query>

<!-----------------------------------NAVIGATION BAR------------------------------------------>

<%@include file="navbar.jsp"%>

<!------------------------------------------------------------------------------------------->

<div class="content">
    <br>
    <h2>TAJUK</h2>

<!---------------------------------------FORM------------------------------------------------->

<c:forEach var="data" items="${speaker.rows}">
    <div class="custform">
        <form class="speaker" method="post" id="form_id" action="TopicServlet">
            <input type="hidden" name="id" value='${data.topicid}'/>

            <div class="dataa">
                <label>   Name </label>
                <input type="text" name="topicName" value='${data.topicname}'' required>
            </div>
            <div class="dataa">
                <labe> Tema</labe>
                <select name="topicTheme" id="theme" required>
                    <option value='${data.topictheme}' >${data.topictheme}</option>
                    <option value="Sirah"	 >Sirah			</option>
				    <option value="Akhlak"	 >Akhlak		</option>
				    <option value="Fiqh"	 >Fiqh			</option>
				    <option value="Tafsir"	 >Tafsir		</option>
				    <option value="Akidah"	 >Akidah		</option>
				    <option value="Lain-lain">Lain-lain		</option>
                </select>
            </div>

            <div id="mybutton" class="button">
                <button type="cancel" name="action"  value="cancel" formaction="TopicServlet">BATAL</button>
                <input type="hidden" name="action" value="updateTopic">
                <button type="button" onclick="calAlert()">KEMASKINI</button>
                <br><br>
            </div>
        </form>
    </div>
</c:forEach>

<!------------------------------------------------------------------------------------------->

</div>

</body>
<script>
function calAlert() {
    Swal.fire({
        title: 'Kemaskini topik',
        text: 'Adakah anda pasti untuk mengemaskini topik ini?',
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
</html>