<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html; charset="UTF-8">
</head>
<body>

<h1>  고객 메인화면 </h1>
<hr>		
<%
	Integer id = (Integer)session.getAttribute("id");
	if(id == null)
 	response.sendRedirect("login.jsp");
%>

<b><%= id %>님이 로그인 하셨습니다!</b><br><br>

<a href="info.jsp">회원정보조회</a>&nbsp;
<!-- <a href="itemlist.jsp">상품 목록</a>&nbsp; -->
<a href="shopping_bag.jsp">장바구니</a>&nbsp;
<a href="history.jsp">구매내역</a><br><br>

<tr><td colspan = "2" align = "center"><input type="button" value="상품목록" onclick="location.href='itemlist.jsp'"></td></tr>		
<tr><td colspan = "2" align = "center"><input type="button" value="로그아웃" onclick="location.href='logout.jsp'"></td></tr>	

</body>
</html>