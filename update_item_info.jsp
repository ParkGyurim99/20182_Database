<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page language="java" import="java.text.*,java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update Item Info.</title>
</head>
<body>
<form action="update_item_Pro.jsp" name="form" method="post">
<br>
<%
	Connection con = null;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/market", "knu", "comp322");

	request.setCharacterEncoding("UTF-8");
	String p_name = request.getParameter("p_name");
	
	System.out.println(p_name);
	out.println("<b>' " + p_name + " ' 의 정보</b><br><br>");
	
	String query = "select p_name, p_price, product.p_num, s_name, quantity from product, sales where p_name = '" + p_name 
			+ "' and sales.p_num = (select p_num from product where p_name = '" + p_name + "');";

	System.out.println(query);
	
	try{	
		pstmt = con.prepareStatement(query);
		rs=pstmt.executeQuery();
		out.println("<table border=\"1\">");
		/* out.println("' " + p_name + " ' 에 대한 정보가 없습니다.<br><br>");
	} */
	
		out.println("<tr>");
		out.println("<td><b>상품 이름</b></td>");
		out.println("<td><b>상품 가격</b></td>");
		out.println("<td><b>상품 번호</b></td>");
		out.println("<td><b>파는 지점</b></td>");
		out.println("<td><b>현재 재고</b></td>");
		out.println("</tr>");
		
		while (rs.next()) {
		
		//p_name = rs.getString("p_name");
		int p_price = rs.getInt("p_price");
		int p_num = rs.getInt("p_num");
		
		String s_name = rs.getString("s_name");
		String quantity = rs.getString("quantity");
		System.out.println(p_name +"\t" + p_price +"\t" + p_num +"\t" + s_name +"\t" + quantity +"\t");
		
		out.println("<tr>");
		out.println("<td>" + p_name + "</td>");
		out.println("<td>" + p_price + "</td>");
		out.println("<td>" + p_num + "</td>");
		out.println("<td>" + s_name + "</td>");
		out.println("<td>" + quantity + "</td>");
		out.println("</tr>");
	}
		out.println("</table>");

	}
	catch (Exception e){
		System.out.println("fail : " + e.toString());
	}
%>
<br>
상품 아이디 : <input type = "text" size = 30 maxlength = 30 name = "p_num">
<br>
<br>
&nbsp;
지점 : <select name="s_name">
       <option value="광주점">광주점</option>
       <option value="군산점">군산점</option>
       <option value="대구점">대구점</option>
       <option value="대전점">대전점</option>
       <option value="동탄점">동탄점</option>
       <option value="부산점">부산점</option>
       <option value="서귀포점">서귀포점</option>
       <option value="서울본점">서울본점</option>
       <option value="속초점">속초점</option>
       <option value="여수점">여수점</option>
       <option value="울산점">울산점</option>
       <option value="인천점">인천점</option>
       <option value="창원점">창원점</option>
       <option value="천안점">천안점</option>
       <option value="청주점">청주점</option>
       <option value="포항점">포항점</option>
     </select>
<br>
<br>
&nbsp;
수량 : <select name="p_quantity">
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
     </select>
 
<button type = "button" onclick="location.href='update_item_list.jsp'">카테고리로 돌아가</button><br><br>
<input type = "submit" value = "재고 주문">

</form>
</body>
</html>