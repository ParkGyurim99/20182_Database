<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page language="java" import="java.text.*,java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
</head>
<body>
<form action="regFormProc.jsp" name="form" method="post">
  <tr>
	<h1> 회원가입 </h1>
	</tr>
	
  <tr>
   <td height="60%" align="center" valign="top">
   <hr><br>
   <p align="left" style="padding-left:160px">
   <b>개인정보입력</b>
   <br><br>
   ID : <input type="text" size="10" maxlength="15" name="id"><br><br>
   비밀번호 : <input type="password" size="15" maxlength="20" name="pw"><br><br>
	배송받을 점포  : <select name= "address">
	   <option value="서울본점">서울본점</option>
	   <option value="대구점">대구점</option>
	   <option value="부산점">부산점</option>
       <option value="대전점">대전점</option>
	   <option value="울산점">울산점</option>
       <option value="인천점">인천점</option>
       <option value="광주점">광주점</option>
       <option value="군산점">군산점</option>
       <option value="동탄점">동탄점</option>
       <option value="서귀포점">서귀포점</option>
       <option value="속초점">속초점</option>
       <option value="여수점">여수점</option>
       <option value="창원점">창원점</option>
       <option value="천안점">천안점</option>
       <option value="청주점">청주점</option>
       <option value="포항점">포항점</option>
     </select><br><br>
   휴대폰 : <select name="ph1">
       <option value="010">010</option>
       <option value="011">011</option>
       <option value="016">016</option>
       <option value="017">017</option>
       <option value="019">019</option>
     </select>
     - <input type="text" name="ph2" size="5" maxlength="4"> - <input type="text" name="ph3" size="5" maxlength="4"><br><br>	
   성별 : <input type="radio" name="gender" value="M"> 남자&nbsp;&nbsp;
   <input type="radio" name="gender" value="F"> 여자<br><br>
   나이 : <input type="text" size="10" maxlength="2" name="age"><br><br>
   이름 : <input type="text" name="name" size="15" maxlength="15"><br><br>
   직업 : <select name= "job">
       <option value="경찰">경찰</option>
       <option value="변호사">변호사</option>
       <option value="소방관">소방관</option>
       <option value="의사">의사</option>
       <option value="선생님">선생님</option>
       <option value="학생">학생</option>
       <option value="회사원">회사원</option>
       <option value="매니저">매니저</option>
       <option value="사업가">사업가</option>
       <option value="제조업자">제조업자</option>
       <option value="입력안함">입력안함</option>
        </select>
   </p>
  </td>
  </tr>
  
  <tr>
   <td align="center">
   <hr><br>
    <input type="submit" value="가입신청">&nbsp;
    <input type="reset" value="다시입력">&nbsp;
    <input type="button" value="취소" onclick = "location.href = 'login.jsp'">
   </td>
  </tr>
  
</form>
</body>
</html>
