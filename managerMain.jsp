<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Manager Main</title>
<head>
<meta http-equiv="Content-Type" content= "text/html; charset="UTF-8">
</head>
<body>

<h1>  관리자 메인화면 </h1><hr>
<%
	Integer id = (Integer)session.getAttribute("id");
	String job = (String)session.getAttribute("job");

	if(id == null) 
	{
		response.sendRedirect("login.jsp");
	}
%>

<b><%= job %>님이 로그인 하셨습니다!</b><hr><br>

<input type="button" value="상품재고추가" onclick="location.href='update_item_list.jsp'">&nbsp;
<input type="button" value="매출정보조회" onclick="location.href='check_profit.jsp'">&nbsp;
<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">	

</body>
</html>