<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html; charset="UTF-8">
</head>
<body>

<h1>  관리자 메인화면 </h1>
<%
	Integer id = (Integer)session.getAttribute("id");
	String job = (String)session.getAttribute("job");

	if(id == null) 
	{
		response.sendRedirect("login.jsp");
	}
%>

<h1><%= job %>님이 로그인 하셨습니다!</h1>

<input type="button" value="상품 재고 추가" onclick="location.href='update_item_list.jsp'"><br>
<input type="button" value="매출정보조회" onclick="location.href='info.jsp'"><br>
<tr><td colspan = "2" align = "center"><input type="button" value="로그아웃" onclick="location.href='logout.jsp'"></td></tr>	

</body>
</html>