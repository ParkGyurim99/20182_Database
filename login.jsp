<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page language="java" import="java.text.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html; charset="UTF-8">
</head>
<body>
<h1> 로그인 </h1><hr>
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
<br>
아이디 <input type = "text" name = "id"/><br><br>
비밀번호 <input type = "password" name = "pw"/><br><br>
<input type="submit" value="로그인하기"/> &nbsp;
<input type="button" value="회원가입" onclick="location.href='regFormImpl2.jsp'">

</form>

</body>
</html>
