<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Profit check</title>
<head>
<meta http-equiv="Content-Type" content= "text/html; charset="UTF-8">
</head>
<body>
<form action="profits.jsp" name="form" method="post">

<h1> 매출 확인 </h1>
<a href="managerMain.jsp"> < 관리자 메인으로 이동 </a><br><br><hr>
<b>확인하고 싶은 날짜 선택</b><hr><br>
   	   <select name= "year">
	       <option value="2018">2018</option>
	       <option value="2017">2017</option>
	       <option value="2016">2016</option>
       </select>년 
       
       <select name= "month">
	       <option value="1">1</option>
	       <option value="2">2</option>
	       <option value="3">3</option>
	       <option value="4">4</option>
	       <option value="5">5</option>
	       <option value="6">6</option>
	       <option value="7">7</option>
	       <option value="8">8</option>
	       <option value="9">9</option>
	       <option value="10">10</option>
	       <option value="11">11</option>
	       <option value="12">12</option>
       </select>월
       
       <select name= "day">
	       <option value="1">1</option>
	       <option value="2">2</option>
	       <option value="3">3</option>
	       <option value="4">4</option>
	       <option value="5">5</option>
	       <option value="6">6</option>
	       <option value="7">7</option>
	       <option value="8">8</option>
	       <option value="9">9</option>
	       <option value="10">10</option>
	       <option value="11">11</option>
	       <option value="12">12</option>
	       <option value="13">13</option>
	       <option value="14">14</option>
	       <option value="15">15</option>
	       <option value="16">16</option>
	       <option value="17">17</option>
	       <option value="18">18</option>
	       <option value="19">19</option>
	       <option value="20">20</option>
	       <option value="21">21</option>
	       <option value="22">22</option>
	       <option value="23">23</option>
	       <option value="24">24</option>
	       <option value="25">25</option>
	       <option value="26">26</option>
	       <option value="27">27</option>
	       <option value="28">28</option>
	       <option value="29">29</option>
	       <option value="30">30</option>
	       <option value="31">31</option>
       </select>일
<br><br><hr>

<input type="radio" name="period" value="Total">전체 &nbsp;&nbsp;
<input type="radio" name="period" value="Month">월별 &nbsp;&nbsp;
<input type="radio" name="period" value="Day">일별 &nbsp;&nbsp;

<input type="submit" value = "매출확인"><br> 
<hr>

</form>
</body>
</html>