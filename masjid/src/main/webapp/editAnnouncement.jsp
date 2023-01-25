<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
  <title></title>
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/style.css">
  <script src="https://kit.fontawesome.com/9bff21277a.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  
</head>
<body>
<%
Class.forName("org.postgresql.Driver");

String dbURL = "jdbc:postgresql://ep-red-river-230703.ap-southeast-1.aws.neon.tech/neondb";
String user = "xtahulasung";
String pass = "Pczo6RY3EQJh";


String id=request.getParameter("id")	;
int num=Integer.parseInt(id);
String sql= "select * from announcement where announcementid='"+num+"'";
Connection con=DriverManager.getConnection(dbURL, user, pass);
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery(sql);
while(rs.next())
{
%>

<%@include file="navbar.jsp"%>

<div class="content">
  
  <br>
  <h2>PENCERAMAH</h2>   

 
        
      <div class="ANNOUNCEMENTFORM">
         <form class="announcement" method="post" enctype="multipart/form-data" action="AnnouncementServlet" id="form_id">
      <div class="dataa">
     <label>   Poster </label>
        <input type="file"  accept="image/*" name="aPicture" id="file"  onchange="loadFile(event)" value='<%=rs.getString("announcementpicture") %>' >
    </div>
    <div class="dataa">
     <label>   Tajuk </label>
        <input type="text" name="aTitle" value='<%=rs.getString("announcementtitle") %>' id="title" required >
    </div>
    <div class="dataa">
    <label>    Tarikh</label>
        <input type="date" name="aDate" value='<%=rs.getString("announcementdate") %>' id="date" min="2020-01-01" >
    </div>
    <div class="dataa">
    <label>    Masa</label>
        <input type="time" name="aTime" value='<%=rs.getString("announcementtime") %>'>
  	</div><div class="dataa">
      <label>  Diskripsi</label>
        <textarea type="text" name="aDesc" style="height:200px;" > <%=rs.getString("announcementdesc") %></textarea>
    </div>
        <div class="dataa">
    <input type="hidden" name="id" value='<%=rs.getString("announcementid") %>'/>  </div>
  
    <%} %>
    
     <div id="mybutton" class="button">
             <button type="cancel" name="action"  value="cancel" formaction="AnnouncementServlet">BATAL</button>
          <input type="hidden" name="action" value="updateAnnouncement">
                        <button type="button"  onclick="calAlert()">KEMASKINI</button>
                         </div>
  </form>
<br><br>
 </div>


           <div class="ANNOUNCEMENTFORM">
 <div class="divposter">
 	<div class="dataa">
      <p><img id="output"  src="${pageContext.servletContext.contextPath }/AnnouncementServlet?id=<%=id %>" style="height:400px;" /></p>
    </div>
      </div>
      </div>

           </div>
          
<br><br><br>

 

</body>
<script type="text/javascript">{var dt = new Date();

</script>
<script>function calAlert() {
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

    Swal.fire({
        title: 'Kemaskini pengumuman',
        text: 'Adakah anda pasti untuk mengemaskini pengumuman ini?',
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
}}
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();
if(dd<10){
    dd='0'+dd
} 
if(mm<10){
    mm='0'+mm
} 
today = yyyy+'-'+mm+'-'+dd;
document.getElementById("date").setAttribute("min", today);
</script>
<style type="text/css">
  h3{color: black;}
  #myInput{display: inline-block;width: 500px ;}
    .ANNOUNCEMENTFORM{display:inline-block;}
  .divposter{padding:1px;background-color:#ffe0b3;height:440px;width:660px; box-shadow: 0px 5px 10px 0px rgba(0, 0, 0, 0.5);}
  #output{max-width:600px;}
</style>
</html>