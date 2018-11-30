<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html; charset="UTF-8">

</head>
<body>
<form action="updatePasswordPro.jsp" name="form" method="post">
  <tr>
	<h1> 비밀번호수정 </h1>
	</tr>
	
  <tr>
   <td height="60%" align="center" valign="top">
   <hr><br>
   <p align="left" style="padding-left:160px">
   <b>수정할 비밀번호 입력</b>
   <br><br>
   <%
	Integer id = (Integer)session.getAttribute("id");
	if(id == null)
 	response.sendRedirect("login.jsp");
	%>

   아이디 : <%= id %>  <br></br>
   비밀번호 : 	<input type="text" size="10" maxlength="4" name="password"><br><br>
   비밀번호 확인 : 	<input type="text" size="10" maxlength="4" name="check_password"><br><br>
   </p>
  </td>
  </tr>
  
  <tr>
   <td align="center">
   <hr><br>
    <input type="submit" value="비밀번호 수정">&nbsp;
    <input type="button" value="뒤로가기" onclick="location.href='info.jsp'"><br>
   </td>
  </tr>
  
 </table>
</form>
</body>
</html>