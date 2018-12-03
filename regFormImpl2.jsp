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
	주소 : <select name= "address">
       <option value="서울특별시">서울특별시</option>
       <option value="대구광역시">대구광역시</option>
       <option value="부산광역시">부산광역시</option>
       <option value="광주광역시">광주광역시</option>
       <option value="인천광역시">인천광역시</option>
       <option value="대전광역시">대전광역시</option>
       <option value="울산광역시">울산광역시</option>
       <option value="제주특별자치도">제주특별자치도</option>
       <option value="경기도">경기도</option>
       <option value="강원도">강원도</option>
       <option value="경상북도">경상북도</option>
       <option value="경상남도">경상남도</option>
       <option value="충청북도">충청북도</option>
       <option value="충청남도">충청남도</option>
       <option value="전라북도">전라북도</option>
       <option value="전라남도">전라남도</option><br></br>
       </select>
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
