<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
   <body>
 
<!------------------------------DATABASE CONNECTION ----------------------------------------->

<sql:setDataSource 
		var		 ="eschedule" 
		driver   ="org.postgresql.Driver"
		url		 ="jdbc:postgresql://ep-winter-moon-258448.ap-southeast-1.aws.neon.tech/neondb"
		user 	 ="mukhliskadir"
		password ="NGx9KZVkQ3am"
/>
     
<sql:query dataSource="${eschedule}" var="oc">
   SELECT * 
   FROM speaker 
   WHERE speakerid>0
</sql:query>

<sql:query dataSource="${eschedule}" var="oe">
   SELECT * 
   FROM topic 
   WHERE topicid>0
</sql:query>
      
<!-----------------------------------NAVIGATION BAR------------------------------------------>

      <%@include file="navbar.jsp"%>

<!------------------------------------------------------------------------------------------->

      <div class="content">
         <br />
         <h2>JADUAL</h2>
<!------------------------------------SEARCH FORM--------------------------------------------->

         <form method="post" action="viewSchedule.jsp">
		<input type="date" name="fDate"> HINGGA
		<input type="date" name="tDate">

            <button  class="action"  type="submit" >CARI</button>
    </form>
    
<!-----------------------------------SCHEDULE FORM----------------------------------------------->
     
         <form class="speaker" method="post" action="ScheduleServlet">
            <div class="schedulee">
               <table class="jaduall">
                  <th style="width: 20%;">TARIKH</th>
                  <th style="width: 40%;">KULIAH DHUHA</th>
                  <th style="width: 40%;">KULIAH MAGHRIB</th>
                  <tr>
                     <td rowspan="2" style="width: 10%;text-align:center;">
                     	AHAD<br>
                        <input type="date" name="scDate" value="" required/>
                     </td>
                     <td>
                        <select name="scSpeaker">
                           <option value="0">Pilih Penceramah...</option>
                           <c:forEach var="result" items="${oc.rows}">
                              <option value="${result.speakerid}">${result.speakername}</option>
                           </c:forEach>
                        </select>
                     </td>

                     <td style="width: 33%;">
                        <select name="scSpeakers">
                           <option value="0">Pilih Penceramah...</option>
                           <c:forEach var="result" items="${oc.rows}">
                              <option value="${result.speakerid}">${result.speakername}</option>
                           </c:forEach>
                        </select>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <select name="scTopic">
                           <option value="0">Pilih Tajuk...</option>
                           <c:forEach var="result" items="${oe.rows}">
                              <option value="${result.topicid}">${result.topicname}</option>
                           </c:forEach>
                        </select>
                     </td>

                     <td>
                        <select name="scTopics">
                           <option value="0">Pilih Tajuk...</option>
                           <c:forEach var="result" items="${oe.rows}">
                              <option value="${result.topicid}">${result.topicname}</option>
                           </c:forEach>
                        </select>
                     </td>
                  </tr>
                  
                   <td rowspan="2" style="width: 10%;text-align:center;">
                    	ISNIN<br> <input type="date" name="scDate2" value="" required/>
                     </td>
                     <td>
                        <select name="scSpeaker2">
                           <option value="0">Pilih Penceramah...</option>
                           <c:forEach var="result" items="${oc.rows}">
                              <option value="${result.speakerid}">${result.speakername}</option>
                           </c:forEach>
                        </select>
                     </td>

                     <td style="width: 33%;">
                        <select name="scSpeakers2">
                           <option value="0">Pilih Penceramah...</option>
                           <c:forEach var="result" items="${oc.rows}">
                              <option value="${result.speakerid}">${result.speakername}</option>
                           </c:forEach>
                        </select>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <select name="scTopic2">
                           <option value="0">Pilih Tajuk...</option>
                           <c:forEach var="result" items="${oe.rows}">
                              <option value="${result.topicid}">${result.topicname}</option>
                           </c:forEach>
                        </select>
                     </td>

                     <td>
                        <select name="scTopics2">
                           <option value="0">Pilih Tajuk...</option>
                           <c:forEach var="result" items="${oe.rows}">
                              <option value="${result.topicid}">${result.topicname}</option>
                           </c:forEach>
                        </select>
                     </td>
                  </tr>
                  
                   <td rowspan="2" style="width: 10%;text-align:center;">
                     	SELASA<br>
                        <input type="date" name="scDate3" value="" required />
                     </td>
                     <td>
                        <select name="scSpeaker3">
                           <option value="0">Pilih Penceramah...</option>
                           <c:forEach var="result" items="${oc.rows}">
                              <option value="${result.speakerid}">${result.speakername}</option>
                           </c:forEach>
                        </select>
                     </td>

                     <td style="width: 33%;">
                        <select name="scSpeakers3">
                           <option value="0">Pilih Penceramah...</option>
                           <c:forEach var="result" items="${oc.rows}">
                              <option value="${result.speakerid}">${result.speakername}</option>
                           </c:forEach>
                        </select>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <select name="scTopic3">
                           <option value="0">Pilih Tajuk...</option>
                           <c:forEach var="result" items="${oe.rows}">
                              <option value="${result.topicid}">${result.topicname}</option>
                           </c:forEach>
                        </select>
                     </td>

                     <td>
                        <select name="scTopics3">
                           <option value="0">Pilih Tajuk...</option>
                           <c:forEach var="result" items="${oe.rows}">
                              <option value="${result.topicid}">${result.topicname}</option>
                           </c:forEach>
                        </select>
                     </td>
                  </tr>
                  
                   <td rowspan="2" style="width: 10%;text-align:center;">
                     	RABU<br>
                        <input type="date" name="scDate4" value="" required />
                     </td>
                     <td>
                        <select name="scSpeaker4">
                           <option value="0">Pilih Penceramah...</option>
                           <c:forEach var="result" items="${oc.rows}">
                              <option value="${result.speakerid}">${result.speakername}</option>
                           </c:forEach>
                        </select>
                     </td>

                     <td style="width: 33%;">
                        <select name="scSpeakers4">
                           <option value="0">Pilih Penceramah...</option>
                           <c:forEach var="result" items="${oc.rows}">
                              <option value="${result.speakerid}">${result.speakername}</option>
                           </c:forEach>
                        </select>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <select name="scTopic4">
                           <option value="0">Pilih Tajuk...</option>
                           <c:forEach var="result" items="${oe.rows}">
                              <option value="${result.topicid}">${result.topicname}</option>
                           </c:forEach>
                        </select>
                     </td>

                     <td>
                        <select name="scTopics4">
                           <option value="0">Pilih Tajuk...</option>
                           <c:forEach var="result" items="${oe.rows}">
                              <option value="${result.topicid}">${result.topicname}</option>
                           </c:forEach>
                        </select>
                     </td>
                  </tr>
                  
                   <td rowspan="2" style="width: 10%;text-align:center;">
                     	KHAMIS<br>
                        <input type="date" name="scDate5" value="" required />
                     </td>
                     <td>
                        <select name="scSpeaker5">
                           <option value="0">Pilih Penceramah...</option>
                           <c:forEach var="result" items="${oc.rows}">
                              <option value="${result.speakerid}">${result.speakername}</option>
                           </c:forEach>
                        </select>
                     </td>

                     <td style="width: 33%;">
                        <select name="scSpeakers5">
                           <option value="0">Pilih Penceramah...</option>
                           <c:forEach var="result" items="${oc.rows}">
                              <option value="${result.speakerid}">${result.speakername}</option>
                           </c:forEach>
                        </select>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <select name="scTopic5">
                           <option value="0">Pilih Tajuk...</option>
                           <c:forEach var="result" items="${oe.rows}">
                              <option value="${result.topicid}">${result.topicname}</option>
                           </c:forEach>
                        </select>
                     </td>

                     <td>
                        <select name="scTopics5">
                           <option value="0">Pilih Tajuk...</option>
                           <c:forEach var="result" items="${oe.rows}">
                              <option value="${result.topicid}">${result.topicname}</option>
                           </c:forEach>
                        </select>
                     </td>
                  </tr>
                  
                   <td rowspan="2" style="width: 10%;text-align:center;">
                     	JUMAAT<br>
                        <input type="date" name="scDate6" value="" required />
                     </td>
                     <td>
                        <select name="scSpeaker6">
                           <option value="0">Pilih Penceramah...</option>
                           <c:forEach var="result" items="${oc.rows}">
                              <option value="${result.speakerid}">${result.speakername}</option>
                           </c:forEach>
                        </select>
                     </td>

                     <td style="width: 33%;">
                        <select name="scSpeakers6">
                           <option value="0">Pilih Penceramah...</option>
                           <c:forEach var="result" items="${oc.rows}">
                              <option value="${result.speakerid}">${result.speakername}</option>
                           </c:forEach>
                        </select>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <select name="scTopic6">
                           <option value="0">Pilih Tajuk...</option>
                           <c:forEach var="result" items="${oe.rows}">
                              <option value="${result.topicid}">${result.topicname}</option>
                           </c:forEach>
                        </select>
                     </td>

                     <td>
                        <select name="scTopics6">
                           <option value="0">Pilih Tajuk...</option>
                           <c:forEach var="result" items="${oe.rows}">
                              <option value="${result.topicid}">${result.topicname}</option>
                           </c:forEach>
                        </select>
                     </td>
                  </tr>
                  
                   <td rowspan="2" style="width: 10%;text-align:center;">
                     	SABTU<br>
                        <input type="date" name="scDate7" value="" required/>
                     </td>
                     <td>
                        <select name="scSpeaker7">
                           <option value="0">Pilih Penceramah...</option>
                           <c:forEach var="result" items="${oc.rows}">
                              <option value="${result.speakerid}">${result.speakername}</option>
                           </c:forEach>
                        </select>
                     </td>

                     <td style="width: 33%;">
                        <select name="scSpeakers7">
                           <option value="0">Pilih Penceramah...</option>
                           <c:forEach var="result" items="${oc.rows}">
                              <option value="${result.speakerid}">${result.speakername}</option>
                           </c:forEach>
                        </select>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <select name="scTopic7">
                           <option value="0">Pilih Tajuk...</option>
                           <c:forEach var="result" items="${oe.rows}">
                              <option value="${result.topicid}">${result.topicname}</option>
                           </c:forEach>
                        </select>
                     </td>

                     <td>
                        <select name="scTopics7">
                           <option value="0">Pilih Tajuk...</option>
                           <c:forEach var="result" items="${oe.rows}">
                              <option value="${result.topicid}">${result.topicname}</option>
                           </c:forEach>
                        </select>
                     </td>
                  </tr>
               </table>
               <input type="hidden" name="scTime" value="Dhuha">
               <input type="hidden" name="scTimes" value="Maghrib">
               <input type="hidden" name="scTime2" value="Dhuha">
               <input type="hidden" name="scTimes2" value="Maghrib">
               <input type="hidden" name="scTime3" value="Dhuha">
               <input type="hidden" name="scTimes3" value="Maghrib">
               <input type="hidden" name="scTime4" value="Dhuha">
               <input type="hidden" name="scTimes4" value="Maghrib">
               <input type="hidden" name="scTime5" value="Dhuha">
               <input type="hidden" name="scTimes5" value="Maghrib">
               <input type="hidden" name="scTime6" value="Dhuha">
               <input type="hidden" name="scTimes6" value="Maghrib">
               <input type="hidden" name="scTime7" value="Dhuha">
               <input type="hidden" name="scTimes7" value="Maghrib">
            </div>
            <div id="mybutton" class="button">
		<form >
   				  <button    type="submit" formaction="senaraiJadual.jsp">UBAH JADUAL</button>
   				  <input type="hidden" name="action" value="addSchedule">
				<button type="add" class="button button1" name="submit" onclick="return confirm('Yakin untuk simpan?')">SIMPAN</button><br><br>
         </form>
      </div>
                
         </form>

         <br />
         <br />
         <br />
      </div>
   
   </body>
   
</html>
