<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Bag</title>
</head>
<body>
<form action="purchase.jsp" name="form" method="post">
<h1>장바구니</h1>
<a href="main.jsp"> < 메인 화면으로 이동 </a><br><br>
	
<%
	int sum = 0;
	Connection con = null;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/market", "knu", "comp322");	
	
	Integer id = (Integer)session.getAttribute("id");
	if(id == null)
 	response.sendRedirect("login.jsp");
	
	out.println("<b>" + id + " 님의 장바구니</b><hr>");
	
	String query;
	if (1000 <= id && id <= 1054) {
		query = "select product.p_num, p_name, quantity, p_price, p_price * quantity " 
				+ "from(product join shopping_bag_item on shopping_bag_item.p_num = product.p_num) "
				+ "where sb_id = " + (id + 1000) + ";";
	}
	else {
		query = "select product.p_num, p_name, quantity, p_price, p_price * quantity " 
				+ "from(product join shopping_bag_item on shopping_bag_item.p_num = product.p_num) "
				+ "where id = " + id + ";";
	}
			
	System.out.println(query);
			
	try{	
		out.println("<table border=\"1\">");
		pstmt = con.prepareStatement(query);
		rs=pstmt.executeQuery();
		out.println("<tr>");
		out.println("<td><b>상품 번호</b></td>");
		out.println("<td><b>상품 이름</b></td>");
		out.println("<td><b>수량</b></td>");
		out.println("<td><b>상품 가격</b></td>");
		out.println("<td><b>총 가격</b></td>");
		out.println("</tr>");
				
		while (rs.next()) {
			int p_num = rs.getInt("product.p_num");
			String p_name = rs.getString("p_name");
			int quantity = rs.getInt("quantity");
			int p_price = rs.getInt("p_price");
				
			out.println("<tr>");
			out.println("<td>" + p_num + "</td>");
			out.println("<td>" + p_name + "</td>");
			out.println("<td>" + quantity + "</td>");
			out.println("<td>" + p_price + "</td>");
			out.println("<td>" + p_price * quantity + "</td>");
			sum += p_price * quantity;
			out.println("</tr>");
		}
		out.println("<td></td><td></td><td>총 가격</td><td>" + sum + "원</td>");
%>
		<td><input type = "submit" value = "주문하기"></td>
		</table>
<%
	}
	catch (Exception e){
		System.out.println("fail : " + e.toString());
	}	
	sum = 0;
%>
</form>
</body>
</html>