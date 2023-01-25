<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
<body>

<!------------------------------DATABASE CONNECTION ----------------------------------------->

<sql:setDataSource 
		var		 ="eschedule" 
		driver   ="org.postgresql.Driver"
		url		 ="jdbc:postgresql://ep-red-river-230703.ap-southeast-1.aws.neon.tech/neondb"
		user 	 ="xtahulasung"
		password ="Pczo6RY3EQJh"
/>
     
      <sql:query dataSource="${eschedule}" var="staff">
         SELECT * 
         FROM staff
      </sql:query>

<!-----------------------------------NAVIGATION BAR------------------------------------------>

      <%@include file="navbar.jsp"%>

<!------------------------------------------------------------------------------------------->
<div class="content">
    <br>
    <h2>URUS AKAUN</h2>
    
<!----------------------------------------FORM----------------------------------------------->
    
    <div class="staffform">
        <form class="staff" method="post" action="StaffServlet"  enctype="multipart/form-data">
        	<div class="dataa">
     		<label>   Gambar Profil </label>
       			 <input type="file"  name="staffPic" id="file"  onchange="loadFile(event)" >
   			</div>
            <div class="dataa">
                <label>   Nama </label>
                <input type="text" name="staffName" value="" id="name"required oninvalid="this.setCustomValidity('Sila masukkan nama')" oninput="setCustomValidity('')">
            </div>
            <div class="dataa">
                <label>No Telefon</label>
                <input type="text" name="staffPhone" id="phone" placeholder="0123456790 tanpa (-)" pattern="^(\d{10}|\d{11})$" required oninvalid="this.setCustomValidity('Sila masukkan no telefon')" oninput="setCustomValidity('')">
            </div>
            <div class="dataa">
                <label>Nama pengguna</label>
                <input type="text" name="staffUsername" id="username" value="" required oninvalid="this.setCustomValidity('Sila masukkan nama pengguna')" oninput="setCustomValidity('')">
            </div>
              <div class="dataa">
                <label>Kata Laluan</label>
  				<input type="password" name="staffPassword"id="password" oninput="validate()"  pattern="(?=^.{6,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required>
            </div>
            <div class="dataa">
                <label>Jawatan</label>
					<select id="select" name="staffRole">
					<option value="Imam">Imam</option>
					<option value="AJK">Ahli Jawatankuasa</option>
					<option value="AJK Multimedia">AJK Multimedia</option>
					
					</select>
			</div>
			<div class="dataa">
                <label>Penyelia</label>
					<select name="supervisor">
                           <option value="0">Pilih Penyelia...</option>
                           <c:forEach var="result" items="${staff.rows}">
                              <option value="${result.staffid}">${result.staffname},${result.staffrole}</option>
                           </c:forEach>
                    </select>
			</div>
		
            <div id="mybutton" class="button">
                <button type="cancel" name="action"  value="cancel" formaction="StaffServlet">BATAL</button>
                <input type="hidden" name="action" value="addStaff">
                <button type="submit" class="button button1" name="submit" onclick="calAlert()">TAMBAH</button><br><br>
            </div>
        </form>
    </div>
    
 <!-----------------------------------DISPLAY IMAGE------------------------------------------->
 
<div class="staffform">
 <div class="divposter">
 	<div class="dataa">
      <p><img id="output" style="height:260px;" /></p>
    </div>
 </div>
</div>
      
<!------------------------------------------------------------------------------------------->

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
        alert("Sila masukkan no telefon tanpa (-)");
        return;
    }
    else if (!document.getElementById("username").checkValidity()) {
        alert("Sila masukkan name pengguna");
        return;
    }
    else if (!document.getElementById("password").checkValidity()) {
        alert("Sila masukkan kata laluan dengan sekurang-kurangnya satu huruf besar, satu huruf kecil, satu nombor dan minimum 6 aksara");
        return;
    }
    else if( !/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$/.test(document.getElementById("password").value)){
    	 alert("Sila masukkan kata laluan dengan sekurang-kurangnya satu huruf besar, satu huruf kecil, satu nombor dan minimum 6 aksara");
         return;
    }
    else {
        // If both input fields are valid, show the confirmation dialog
        Swal.fire({
            title: 'Berjaya',
            text: 'Staff berjaya ditambah!',
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
<style type="text/css">
  h3{color: black;}
  #myInput{display: inline-block;width: 500px ;}
  .staffform{display:inline-block;}
  .divposter{padding:1px;background-color:#ffe0b3;height:300px;width:300px; box-shadow: 0px 5px 10px 0px rgba(0, 0, 0, 0.5);}
  #output{max-width:600px;}
</style>
</html>