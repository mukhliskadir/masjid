<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

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
      <div id="delete">
         <div class="message">ADAKAH ANDA PASTI UNTUK BUANG?</div>
         <br>
         <button type="cancel" class="no">BATAL</button>
         <button type="delete" class="yes">BUANG</button>
      </div>
      
    
    
  
      <%@include file="database.jsp"%>
      
      <%@include file="navbar.jsp"%>
      
        <sql:query dataSource="${eschedule}" var="oc">
         SELECT row_number() over (order by announcementdate desc)   "rank",announcementpicture,announcementid,announcementtitle,announcementdesc,to_char(now(),'YYYY-MM-DD')"currentdate",to_char(announcementdate,'YYYY-MM-DD')"announcementdate",announcementtime,announcementstatus from announcement
      </sql:query>
     
      <div class="content" ><br>	
      
         <h2>PENGUMUMAN</h2>
         
         <select name="topicTheme" id="myInput" >
    <option value="Aktif" 		 >Aktif</option>
    <option value="Selesai"	 >Selesai		</option>
 
</select>

<input type="button" class="tajuk" onclick="cariPengumuman()" value="Isih" >
    
         <div id="mybutton" class="button">
            <button class="add" type="add" value="add" onclick="location.href='addAnnouncement.jsp'">TAMBAH</button>
         </div>
         
     
         <div style="overflow-x:auto;">
            
            <table style="text-align: center;" id="listPengumuman">
               <tr>
                  <th onclick="sortTable(0)" style="width: 80px; height: 50px;">No.</th>
                  <th onclick="sortTable(1)" style="width:400px;">Gambar</th>	
                  <th onclick="sortTable(2)" style="width: 350px;">Tajuk</th>
                  <th onclick="sortTable(2)" style="width: 460px;">Deskripsi</th>
                  <th onclick="sortTable(4)" style="width: 250px;">Tarikh & Masa</th>
                  <th onclick="sortTable(4)" style="width: 250px;">Status</th>
                  <th style="width: 100px;">Action</th>
               </tr>
               
               <c:forEach var="result" items="${oc.rows}">
                  <tr>
                     <td class="no">
                        <c:out value="${result.rank}"/>
                     </td>
                     <td class="name">
            			<img style="width:300px;height:150px;" src="${pageContext.servletContext.contextPath }/AnnouncementServlet?id=${result.announcementid}" />
						</td>
                     <td class="no">
                        <c:out value="${result.announcementtitle}"/>
                     </td>
                     <td class="id">
                        <c:out value="${result.announcementdesc}"/>
                     </td>
                     <td class="id">
                     	Tarikh	:
                        <c:out value="${result.announcementdate}"/>
          
                        <br>
                        Masa	:
                        <c:out value="${result.announcementtime}"/>
                     </td>
                     
                     <c:if test="${result.announcementdate>=result.currentdate}">
    				  <td >Aktif</td>
					</c:if>
					  <c:if test="${result.announcementdate<result.currentdate}">
    				  <td >Selesai</td>
					</c:if>
					
					
                      
                     <td>
                        <form method="post">
                           <button  class="action"  type="edit" formaction="editAnnouncement.jsp?id=${result.announcementid}"
                              >KEMASKINI
                           </button>
                        </form>
                        
                        <form method="post"  id="form_id"  action="AnnouncementServlet">
                            <input type="hidden" name="aId" id="ancIdInput" >
    <input type="hidden" name="action" value="deleteAnnouncement" id="test">
    <button  class="action"  type="button" onclick="callAlert('${result.announcementid}');">BUANG</button>
</form>
                     </td>
                  </tr>
               </c:forEach>
            </table>
         </div>
         <br><br><br>
      </div>
      <style>
         h3{color: black;}
         #myInput{display: inline-block;width: 500px ;}
      </style>
      <script>
      function callAlert(aId) {
    	    Swal.fire({
    	        title: 'Buang pengumuman',
    	        text: 'Adakah anda pasti untuk membuang pengumuman ini?',
    	        icon: 'warning',
    	        showCancelButton: true,
    	        cancelButtonText: 'BATAL',
    	        confirmButtonText: 'YA',
    	        confirmButtonColor: '#d33',

    	    }).then((result) => {
    	        if (result.value) {
    	            // If the user confirms, submit the form
    	            document.getElementById("ancIdInput").value=aId;
    	            document.getElementById("form_id").submit();
    	        }
    	    })
    	}

      </script>
   </body>
</html>