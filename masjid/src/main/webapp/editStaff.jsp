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
    String id=request.getParameter("id");
    int num=Integer.parseInt(id);
    String sql= "select * from staff left outer join imam using(staffid) where staffid='"+num+"'";
    Connection con=DriverManager.getConnection(dbURL, user, pass);
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery(sql);
    while(rs.next())
    {
%>


<%@include file="navbar.jsp"%>
<div class="content">
    <br>
    <h2>IMAM</h2>
    <div class="staffform">
        <form class="staff" method="post" enctype="multipart/form-data"  action="StaffServlet" id="form_id">
            <input type="hidden" name="id" value='<%=rs.getString("staffid") %>'/>
            
        	<div class="dataa">
     		<label>   Gambar Profile </label>
        <input type="file"  accept="image/*" name="staffPic" id="file"  onchange="loadFile(event)"  >
   			</div>
            <div class="dataa">
                <label>   Nama </label>
                <input type="text" name="staffName" value='<%=rs.getString("staffname") %>' id="name" required>
            </div>
            <div class="dataa">
                <label>No Telefon</label>
                <input type="text" name="staffPhone" value='<%=rs.getString("staffphoneno") %>' id="phone"  required pattern="^(\d{10}|\d{11})$">
            </div>
            <div class="dataa">
                <label>Nama pengguna</label>
                <input type="text" name="staffUsername" value='<%=rs.getString("staffusername") %>'  required id="username" >
            </div>
              <div class="dataa">
                <label>Kata Laluan</label>
                <input type="password" name="staffPassword" value='<%=rs.getString("staffpass") %>'  id="password" required>
            </div>
           
            <%} %>
            <div id="mybutton" class="button">
                  <button type="cancel" name="action"  value="cancel" formaction="StaffServlet">BATAL</button>
                <input type="hidden" name="action" value="updateStaff">
                <button type="button" formaction="StaffServlet"onclick="calAlert()">KEMASKINI</button>
                <br><br>
            </div>
        </form>
    </div>
     <div class="staffform">
 <div class="divposter">
 	<div class="dataa">
      <p><img id="output"  src="${pageContext.servletContext.contextPath }/StaffServlet?id=<%=id %>" style="height:260px;" /></p>
    </div>
      </div>
      </div>
</div>
<br><br><br>
</body>
<script type="text/javascript">

var loadFile = function(event) {
	  var image = document.getElementById('output');
	  image.src = URL.createObjectURL(event.target.files[0]);
	};
</script>
<script>function calAlert() {
	 if (!document.getElementById("name").checkValidity()) {
	        alert("Sila masukkan nama");
	        return;
	    }
	    // Check if the phone number input field is valid
	    else if (!document.getElementById("phone").checkValidity()) {
	        alert("Sila masukkan no telefon tanpa (-)");
	        return;
	    }
	    else if (!document.getElementById("username").checkValidity()) {
	        alert("Sila masukkan name pengguna");
	        return;
	    }
	    else if (!document.getElementById("password").checkValidity() || !/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$/.test(document.getElementById("password").value)) {
	        alert("Sila masukkan kata laluan dengan sekurang-kurangnya satu huruf besar, satu huruf kecil, satu nombor dan minimum 6 aksara");
	        return;
	    }
	    else {
	Swal.fire({
        title: 'Kemaskini profil',
        text: 'Adakah anda pasti untuk mengemaskini profil ini?',
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
}

</script>
<style type="text/css">
    h3{color: black;}
    #myInput{display: inline-block;width: 500px ;}
    .staffform{display:inline-block;}
  .divposter{padding:1px;background-color:#ffe0b3;height:300px;width:300px; box-shadow: 0px 5px 10px 0px rgba(0, 0, 0, 0.5);}
  #output{max-width:600px;}
</style>
</html>