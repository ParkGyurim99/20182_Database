<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html; charset="UTF-8">
</head>
<body>
<h1> 메인화면 </h1>

<form action = info.jsp" method = "post">

<%
	Integer id = (Integer)session.getAttribute("id");
	if(id == null)
 	response.sendRedirect("login.jsp");
%>


<h1><%= id %>님이 로그인 하셨습니다!</h1>

<a href="info.jsp">회원정보조회</a><br><br>
<input type="button" value="뒤로가기" onclick="location.href='login.jsp'"><br>

</body>
</html>