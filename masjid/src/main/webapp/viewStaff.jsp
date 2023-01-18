<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<sql:setDataSource 
		var		 ="eschedule" 
		driver   ="org.postgresql.Driver"
		url		 ="jdbc:postgresql://ep-red-river-230703.ap-southeast-1.aws.neon.tech/neondb"
		user 	 ="xtahulasung"
		password ="Pczo6RY3EQJh"/>
                   
<sql:query dataSource="${eschedule}" var="staff">
    SELECT row_number() over (order by staffid) "rank",staffid,staffname,staffphoneno,staffusername,staffpass,staffrole,staffpicture from staff
</sql:query>

<%@include file="navbar.jsp"%>


<div class="content" >
    <br>
    <h2>STAFF MASJID</h2>
<c:if test="${sessionScope.staffrole == 'AJK Multimedia' }" >     
    <div id="mybutton" class="button">
        <button class="add" type="add" value="add" onclick="location.href='addStaff.jsp'">TAMBAH</button>
    </div>
 </c:if>
    <div style="overflow-x:auto;">
        <table style="text-align: center;" id="listPenceramah">
            <tr>
                <th onclick="sortTable(0)" style="width: 80px; height: 50px;">⥯ No.</th>
                <th style="width:200px;">Gambar</th>
                <th onclick="sortTable(1)" style="width:600px;">⥯ Nama</th>
                <th onclick="sortTable(2)" style="width: 300px;">⥯ No. Telefon</th>
                <th onclick="sortTable(4)" style="width: 250px;">⥯ Jawatan</th>
                <th style="width: 100px;">Tindakan</th>
            </tr>
            <c:forEach var="result" items="${staff.rows}">
		<c:if test="${sessionScope.staffrole== 'AJK Multimedia'||sessionScope.staffrole== 'Pengerusi'}" > 
                <tr>
                    <td >
                        <c:out value="${result.rank}"/>
                    </td>
                    <td class="name">
            			<img style="width:150px;height:150px;" src="${pageContext.servletContext.contextPath }/StaffServlet?id=${result.staffid}" />
						</td>
                    <td >
                        <c:out value="${result.staffname}"/>
                    </td>
                    <td>
                        <c:out value="${result.staffphoneno}"/>
                    </td>
                    <td>
                        <c:out value="${result.staffrole}"/>
                    </td>
                 
                    <td>
                        <form method="post">
                            <button  class="action"  type="edit" formaction="staffDetails.jsp?id=${result.staffid}">LIHAT</button>
                        </form>
         		<c:if test="${sessionScope.staffrole != 'Pengerusi' }" > 
                       <form method="post" id="form_id"  action="StaffServlet">
					    	<input type="hidden" name="staff" id="staffIdInput" >
					   		<input type="hidden" name="action" value="deleteStaff" >
					    	<button  class="action"  type="button" onclick="callAlert('${result.staffid}');">BUANG</button>
			     		</form>
                   </c:if>
                    </td>
                </tr>
                </c:if>
            </c:forEach>
		<c:if test="${sessionScope.staffrole != 'AJK Multimedia' }" > 
           <div style="background-color:red; color:white;padding:10px;">
  				ANDA TIDAK MEMPUNYAI AKSES UNTUK MENGURUS AKAUN, SILA BERJUMPA PIHAK AJK MULTIMEDIA UNTUK SEBARANG PERUBAHAN.      
           </div>
           
           </c:if>
            
        </table>
    </div>
    <br><br><br>
</div>

</body>
<script>function callAlert(staffId) {
    Swal.fire({
        title: 'Buang profil',
        text: 'Adakah anda pasti untuk membuang profil ini?',
        icon: 'warning',
        showCancelButton: true,
        cancelButtonText: 'BATAL',
        confirmButtonText: 'YA',
        confirmButtonColor: '#d33',

    }).then((result) => {
        if (result.value) {
            // If the user confirms, submit the form
            document.getElementById("staffIdInput").value=staffId;
            document.getElementById("form_id").submit();
        }
    })
}

</script>
<style>
    h3{color: black;}
    #myInput{display: inline-block;width: 500px ;}
</style>

</html>