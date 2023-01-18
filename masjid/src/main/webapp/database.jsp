<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<sql:setDataSource 
		var		 ="eschedule" 
		driver   ="org.postgresql.Driver"
		url		 ="jdbc:postgresql://ep-red-river-230703.ap-southeast-1.aws.neon.tech/neondb"
		user 	 ="xtahulasung"
		password ="Pczo6RY3EQJh"
/>
         
<sql:query dataSource="${eschedule}" var="topic">
    SELECT row_number() over (order by topicid desc)"rank",topicid,topicname,topictheme 
    FROM topic
    WHERE topicid>0
</sql:query>

<sql:query dataSource="${eschedule}" var="speaker">
    SELECT row_number() over (order by speakerid desc)  "rank",speakerid,speakername,speakerphoneno,speakereducation 
    FROM speaker
    WHERE speakerid>0
</sql:query>
