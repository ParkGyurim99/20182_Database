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

<h1> 재고를 추가할 상품을 고르시오 </h1><br>
상품 검색 : <input type = "text" size = 30 maxlength = 30 name = "search">
<input type = "submit" value = "검색">
 <br><br>
 
	<tr>
		<td height="60%" align="center" valign="top">
		<b>과일류</b>
		<hr>
  	 	<li>바나나 / 오렌지 &nbsp;&nbsp;<button type="button" onclick="location.href='list_banana.jsp'">이동</button></li> <br>		
  		<li>사과 / 배 &nbsp;&nbsp;<button type="button" onclick="location.href='list_apple.jsp'">이동</button></li> <br>
		<li>수박 / 메론 / 참외 &nbsp;&nbsp;<button type="button" onclick="location.href='list_watermelon.jsp'">이동</button></li> <br>
		</td>
		<br>
		
		<b>과자 / 초콜릿류</b>
		<td height="60%" align="center" valign="top">
		<hr>
		<li>사탕 / 젤리 &nbsp;&nbsp;<button type="button" onclick="location.href='list_candy.jsp'">이동</button></li> <br>
		<li>스낵 &nbsp;&nbsp;<button type="button" onclick="location.href='list_snack.jsp'">이동</button></li> <br>
		<li>초콜릿 / 초코바 &nbsp;&nbsp;<button type="button" onclick="location.href='list_choco.jsp'">이동</button></li> <br>
		</td>
		<br>
		
		<b>정육류</b>
		<td height="60%" align="center" valign="top">
		<hr>
		<li>닭 / 오리고기 &nbsp;&nbsp;<button type="button" onclick="location.href='list_chicken.jsp'">이동</button></li> <br>
		<li>돼지고기 &nbsp;&nbsp;<button type="button" onclick="location.href='list_pork.jsp'">이동</button></li> <br>
		<li>소고기 &nbsp;&nbsp;<button type="button" onclick="location.href='list_beef.jsp'">이동</button></li> <br>
		</td>
	</tr>
</form>
<input type="button" value="뒤로가기" onclick="location.href='managerMain.jsp'"><br></body>
</html>