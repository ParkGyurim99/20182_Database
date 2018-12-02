<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page language="java" import="java.text.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html; charset="UTF-8">
</head>
<body>
<h1> 로그인 </h1>
<form action = "login_check.jsp" method = "post">

<%	

String id;
String job = (String)session.getAttribute("job");

if (session.getAttribute("id") != null && job.equals("관리자"))
{
	id = "관리자 로그인 ";
}

else if(session.getAttribute("id") != null)
{
	id = "고객 로그인 중";
}

else
{
	id = "세션값 없음";
}

%>


<table>
	<tr><th colspan = "2"> 로그인 </th></tr>
	<tr>
	<td>아이디</td>
	<td><input type = "text" name = "id"/></td>
	</tr>
	<tr>
	<td>비밀번호</td>
	<td><input type = "password" name = "pw"/></td>
	</tr>
	<tr><td colspan = "2" align="center"><input type="submit" value="로그인하기"/></td></tr>
	<tr><td colspan = "2" align = "center"><input type="button" value="회원가입" onclick="location.href='regFormImpl2.jsp'"></td></tr>	
</table>

</form>
<%= id %>

</body>
</html>
