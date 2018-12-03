<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>History</title>
</head>
<body>
<h1>구매 내역</h1>
<a href="main.jsp"> < 메인 화면으로 이동 </a><br><br>
	
<%
	Connection con = null;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/market", "knu", "comp322");	
	
	Integer id = (Integer)session.getAttribute("id");
	if(id == null)
 	response.sendRedirect("login.jsp");
	
	out.println("<b>" + id + " 님의 구매내역</b>");
	
	String query = "select sb_id, product.p_num, p_name, quantity, p_price, p_price * quantity "
			+ "from (product join shopping_bag_item on shopping_bag_item.p_num = product.p_num) "
			+ "where id = " + id  + ";";
			
	System.out.println(query);
	
	int temp = id + 1000;
	
	out.println("<table border=\"1\">");
	pstmt = con.prepareStatement(query);
	rs=pstmt.executeQuery();
	
/* 	
	out.println("<tr>");
	out.println("<td><b>장바구니 번호</b></td>");
	out.println("<td><b>상품 번호</b></td>");
	out.println("<td><b>상품 이름</b></td>");
	out.println("<td><b>수량</b></td>");
	out.println("<td><b>상품 가격</b></td>");
	out.println("<td><b>총 가격</b></td>");
	out.println("</tr>");
*/
	while (rs.next()) {
		int sb_id = rs.getInt("sb_id");
		int p_num = rs.getInt("product.p_num");
		String p_name = rs.getString("p_name");
		int quantity = rs.getInt("quantity");
		int p_price = rs.getInt("p_price");
		
		if (sb_id == id + 1000);
		else {
			if (temp == sb_id) {
				out.println("<tr>");
				out.println("<td>" + sb_id + "</td>");
				out.println("<td>" + p_num + "</td>");
				out.println("<td>" + p_name + "</td>");
				out.println("<td>" + quantity + "</td>");
				out.println("<td>" + p_price + "</td>");
				out.println("<td>" + p_price * quantity + "</td>");
				out.println("</tr>");
			}
			else {
				out.println("</table>");
				out.println("<hr>");
				PreparedStatement pstmt2 = con.prepareStatement("select sb_date from shopping_bag where sb_id = " + sb_id + ";");
				ResultSet rs2 = pstmt2.executeQuery();
				rs2.next();
				java.sql.Date date = rs2.getDate("sb_date");
				long a = date.getTime();
				out.println("<h4><b>< 구매 일자 : " + new Date(a) + " ></b></h4>");
				
				
				temp = sb_id;
				
				out.println("<table border=\"1\">");
				out.println("<tr>");
				out.println("<td><b>장바구니 번호</b></td>");
				out.println("<td><b>상품 번호</b></td>");
				out.println("<td><b>상품 이름</b></td>");
				out.println("<td><b>수량</b></td>");
				out.println("<td><b>상품 가격</b></td>");
				out.println("<td><b>총 가격</b></td>");
				out.println("</tr>");
				
				
				out.println("<tr>");
				out.println("<td>" + sb_id + "</td>");
				out.println("<td>" + p_num + "</td>");
				out.println("<td>" + p_name + "</td>");
				out.println("<td>" + quantity + "</td>");
				out.println("<td>" + p_price + "</td>");
				out.println("<td>" + p_price * quantity + "</td>");
				out.println("</tr>");
			}
		}
	}
	out.println("</table>");	
%>

</body>
</html>