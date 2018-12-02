<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page language="java" import="java.text.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html; charset="UTF-8">
</head>
<body>

<h1> 로그아웃 </h1>

	<%
	session.invalidate();
	%>

	<script type="text/javascript">
	alert("로그아웃 되었습니다.");
	location.href="login.jsp";
	</script>

</body>
</html>