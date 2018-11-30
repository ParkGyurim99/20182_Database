<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html; charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
<form action="updatePro.jsp" name="form" method="post">
  <tr>
	<h1> 회원정보 수정 </h1>
	</tr>
	
  <tr>
   <td height="60%" align="center" valign="top">
   <hr><br>
   <p align="left" style="padding-left:160px">
   <b>수정할 정보 입력</b>
   <br><br>
   <%
	Integer id = (Integer)session.getAttribute("id");
	if(id == null)
 	response.sendRedirect("login.jsp");
	%>

   아이디 : <%= id %>  <br></br>
   주소 : <select name= "address">
       <option value="Seoul">서울특별시</option>
       <option value="Daegu">대구광역시</option>
       <option value="Busan">부산광역시</option>
       <option value="Gwangju">광주광역시</option>
       <option value="Incheon">인천광역시</option>
       <option value="Daejeon">대전광역시</option>
       <option value="Ulsan">울산광역시</option>
       <option value="Jeju">제주특별자치도</option>
       <option value="Gyeonggi">경기도</option>
       <option value="Gangwon">강원도</option>
       <option value="Gyeongbuk">경상북도</option>
       <option value="Gyeongnam">경상남도</option>
       <option value="Chungbuk">충청북도</option>
       <option value="Chungnam">충청남도</option>
       <option value="Jeonbuk">전라북도</option>
       <option value="Jeonnam">전라남도</option>
     </select><br>
   휴대폰 : <select name="ph1">
       <option value="010">010</option>
       <option value="011">011</option>
       <option value="016">016</option>
       <option value="017">017</option>
       <option value="019">019</option>
     </select>
     - <input type="text" name="ph2" size="5" maxlength="4"> - <input type="text" name="ph3" size="5" maxlength="4"><br><br>	
   나이 : <input type="text" size="10" maxlength="2" name="age"><br><br>
   직업 : <input type="text" name="job" size="15" maxlength="15"><br><br>
   </p>
  </td>
  </tr>
  
  <tr>
   <td align="center">
   <hr><br>
    <input type="submit" value="수정">&nbsp;
    <input type="button" value="뒤로가기" onclick="location.href='info.jsp'"><br>
   </td>
  </tr>
  
 </table>
</form>
</body>
</html>