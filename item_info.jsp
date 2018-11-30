<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page language="java" import="java.text.*,java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item Info.</title>
</head>
<body>
<form action="itemlist.jsp" name="form" method="post">
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
	
	String query = "select p_name, p_price, product.p_num, c_name, company, c_location from product, producer where p_name = '" + p_name 
			+ "' and producer.p_num = (select p_num from product where p_name = '" + p_name + "');";

	System.out.println(query);
	
	try{	
		out.println("<table border=\"1\">");
		pstmt = con.prepareStatement(query);
		rs=pstmt.executeQuery();
		
		if (rs.next() == false) {
			out.println("' " + p_name + " ' 에 대한 정보가 없습니다.<br><br>");
		}
		
		else {
		out.println("<tr>");
		out.println("<td><b>상품 이름</b></td>");
		out.println("<td><b>상품 가격</b></td>");
		out.println("<td><b>상품 번호</b></td>");
		out.println("<td><b>카테고리 이름</b></td>");
		out.println("<td><b>제조사</b></td>");
		out.println("<td><b>제조사 소재지</b></td>");
		out.println("</tr>");
		
		//p_name = rs.getString("p_name");
		int p_price = rs.getInt("p_price");
		int p_num = rs.getInt("p_num");
		String c_name = rs.getString("c_name");
		String company = rs.getString("company");
		String c_location = rs.getString("c_location");
		System.out.println(p_name +"\t" + p_price +"\t" + p_num +"\t" + c_name +"\t" + company +"\t" + c_location);
		
		out.println("<tr>");
		out.println("<td>" + p_name + "</td>");
		out.println("<td>" + p_price + "</td>");
		out.println("<td>" + p_num + "</td>");
		out.println("<td>" + c_name + "</td>");
		out.println("<td>" + company + "</td>");
		out.println("<td>" + c_location + "</td>");
		out.println("</tr>");
		out.println("</table>");
		}
	}
	catch (Exception e){
		System.out.println("fail : " + e.toString());
	}
%>
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
<button type = "button" onclick="location.href='itemlist.jsp'">장바구니에 추가</button><br>
<input type = "submit" value = "카테고리로 돌아가기">

</form>
</body>
</html>