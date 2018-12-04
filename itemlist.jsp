<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>item list</title>
</head>
<body>
<form action="search.jsp" name="form" method="post">

<%
	Integer id = (Integer)session.getAttribute("id");
	String job = (String)session.getAttribute("job");
	if(id == null) 
	{
		response.sendRedirect("login.jsp");
	}
	
	else if (job.equals("관리자"))
	{
		response.sendRedirect("update_item_list.jsp");
	}
%>

<h1> 상품 목록  </h1>
<a href="main.jsp"> < 메인 화면으로 이동</a><br><br>

상품 검색 : <input type = "text" size = 30 maxlength = 30 name = "search">
<input type = "submit" value = "검색">
<input type="button" value="고객 맞춤 추천상품" onclick="location.href='item_recommend.jsp'"></td></tr>	

<br><br>

	<b>과일류</b>
	<hr>
  	<li>바나나 / 오렌지 &nbsp;&nbsp;<button type="button" onclick="location.href='list_banana.jsp'">이동</button></li> <br>		
  	<li>사과 / 배 &nbsp;&nbsp;<button type="button" onclick="location.href='list_apple.jsp'">이동</button></li> <br>
	<li>수박 / 메론 / 참외 &nbsp;&nbsp;<button type="button" onclick="location.href='list_watermelon.jsp'">이동</button></li> <br>
	<br>
		
	<b>과자 / 초콜릿류</b>
	<hr>
	<li>사탕 / 젤리 &nbsp;&nbsp;<button type="button" onclick="location.href='list_candy.jsp'">이동</button></li> <br>
	<li>스낵 &nbsp;&nbsp;<button type="button" onclick="location.href='list_snack.jsp'">이동</button></li> <br>
	<li>초콜릿 / 초코바 &nbsp;&nbsp;<button type="button" onclick="location.href='list_choco.jsp'">이동</button></li> <br>
	<br>
		
	<b>정육류</b>
	<hr>
	<li>닭 / 오리고기 &nbsp;&nbsp;<button type="button" onclick="location.href='list_chicken.jsp'">이동</button></li> <br>
	<li>돼지고기 &nbsp;&nbsp;<button type="button" onclick="location.href='list_pork.jsp'">이동</button></li> <br>
	<li>소고기 &nbsp;&nbsp;<button type="button" onclick="location.href='list_beef.jsp'">이동</button></li> <br>
	
</form>
</body>
</html>