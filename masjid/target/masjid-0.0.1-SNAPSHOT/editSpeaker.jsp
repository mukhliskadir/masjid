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
        <form class="speaker" method="post">
            <input type="hidden" name="id" value='${data.speakerid}'/>
            <div class="dataa">
                <label>   Name </label>
                <input type="text" name="speakerName" value='${data.speakername}' required>
            </div>
            <div class="dataa">
                <label>  Phone</label>
                <input type="text" name="speakerPhone" value='${data.speakerphoneno}' pattern="[0-9]{3}-[0-9]{8}">
            </div>
            <div class="dataa">
                <label>    Education</label>
                <input type="text" name="speakerEdu" value='${data.speakereducation}'>
            </div>

             <div id="mybutton" class="button">
                <button type="cancel" name="action"  value="cancel" formaction="TopicServlet">BATAL</button>
                <input type="hidden" name="action" value="updateSpeaker">
                <button type="submit" formaction="SpeakerServlet"onclick="return confirm('Yakin untuk simpan ?');">KEMASKINI</button>
                <br><br>
            </div>
        </form>
    </div>
</c:forEach>

<!------------------------------------------------------------------------------------------->

</div>

</body>
</html>