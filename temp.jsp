<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>temp</title>
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
	
	for (int i = 2055; i < 2200; i++) {
		String query = "select sb_id, product.p_num, p_name, quantity, p_price, p_price * quantity "
			+ "from (product join shopping_bag_item on shopping_bag_item.p_num = product.p_num) where sb_id = " + i + ";";
		//System.out.println(query);	
		//out.println(query);		

	
		out.println("<table border=\"1\">");
		pstmt = con.prepareStatement(query);
		rs=pstmt.executeQuery();
		out.println("<tr>");
		out.println("<td><b>장바구니 번호</b></td>");
		out.println("<td><b>총 가격</b></td>");
		out.println("</tr>");
			
		int sb_id = 0;
		while (rs.next()) {
			sb_id = rs.getInt("sb_id");
/* 			int p_num = rs.getInt("product.p_num");
			String p_name = rs.getString("p_name"); */
			int quantity = rs.getInt("quantity");
			int p_price = rs.getInt("p_price");
				
			//out.println("<tr>");
			//out.println("<td>" + sb_id + "</td>");
/* 			out.println("<td>" + p_num + "</td>");
			out.println("<td>" + p_name + "</td>");
			out.println("<td>" + quantity + "</td>");
			out.println("<td>" + p_price + "</td>");
			out.println("<td>" + p_price * quantity + "</td>"); */
			sum += p_price * quantity;
			//out.println("</tr>");
		}
		out.println("<td>"+ sb_id + "</td><td>" + sum + "</td>");
		String query2 = "update shopping_bag set total = " + sum + " where sb_id = " + sb_id + ";";
		out.println(query2);
		System.out.println(query2);
		/* PreparedStatement pstmt2 = con.prepareStatement(query2);
 		pstmt2.executeUpdate(query2); */
	}
	sum = 0;
%>
</form>
</body>
</html>