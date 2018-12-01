<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html; charset="UTF-8">
</head>
<body>
<form action = info.jsp" method = "post">
<h1> 메인화면 </h1>
<hr>		
<%
	Integer id = (Integer)session.getAttribute("id");
	if(id == null)
 	response.sendRedirect("login.jsp");
%>

<b><%= id %>님이 로그인 하셨습니다!</b><br><br>

<a href="info.jsp">회원정보조회</a>&nbsp;
<a href="itemlist.jsp">상품 목록</a>&nbsp;
<a href="shopping_bag.jsp">장바구니</a><br><br>

<input type="button" value="뒤로가기" onclick="location.href='login.jsp'"><br>

</body>
</html>