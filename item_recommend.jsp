<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page language="java" import="java.text.*,java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 맞춤 추천 상품</title>
</head>
<body>
<h1>고객 맞춤 추천 상품 </h1>
<a href="itemlist.jsp"> < 상품목록으로 이동 </a><br><br>
고객님의 연령대 고객님들이 <b>가장 많이 구매</b>하신 상품입니다. 
<hr><br>
<%	
	Connection con = null;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/market", "knu", "comp322");
	
	Integer id = (Integer)session.getAttribute("id");
	if(id == null)
 	response.sendRedirect("login.jsp");
	
	String Query = "select age from customer where id = " + id + ";";
	pstmt = con.prepareStatement(Query);
	rs=pstmt.executeQuery();
	
	rs.next();
	int age = rs.getInt("age");
	
	if (9 < age && age < 20) {
		Query = "SELECT * FROM (SELECT rank() over(ORDER BY SUM(quantity)) AS Ranking, p_num"
	               + " FROM shopping_bag_item WHERE sb_id IN "
	               + " (SELECT sb_id FROM shopping_bag_item "
	                + "WHERE p_num = (select p_num from pop10 where sum = (select max(sum) from pop10))) "
	               + "GROUP BY p_num)R WHERE Ranking <= 5;";
	}
	else if (19 < age && age < 30) {
		Query = "SELECT * FROM (SELECT rank() over(ORDER BY SUM(quantity)) AS Ranking, p_num"
	               + " FROM shopping_bag_item WHERE sb_id IN "
	               + " (SELECT sb_id FROM shopping_bag_item "
	                + "WHERE p_num = (select p_num from pop20 where sum = (select max(sum) from pop20))) "
	               + "GROUP BY p_num)R WHERE Ranking <= 5;";
	}
	else if (29 < age && age < 40) {
		Query = "SELECT * FROM (SELECT rank() over(ORDER BY SUM(quantity)) AS Ranking, p_num"
	               + " FROM shopping_bag_item WHERE sb_id IN "
	               + " (SELECT sb_id FROM shopping_bag_item "
	                + "WHERE p_num = (select p_num from pop30 where sum = (select max(sum) from pop30))) "
	               + "GROUP BY p_num)R WHERE Ranking <= 5;";
	}
	else if (39 < age && age < 50) {
		Query = "SELECT * FROM (SELECT rank() over(ORDER BY SUM(quantity)) AS Ranking, p_num"
	               + " FROM shopping_bag_item WHERE sb_id IN "
	               + " (SELECT sb_id FROM shopping_bag_item "
	                + "WHERE p_num = (select p_num from pop40 where sum = (select max(sum) from pop40))) "
	               + "GROUP BY p_num)R WHERE Ranking <= 5;";
	}
	else if (49 < age && age < 60) {
		Query = "SELECT * FROM (SELECT rank() over(ORDER BY SUM(quantity)) AS Ranking, p_num"
	               + " FROM shopping_bag_item WHERE sb_id IN "
	               + " (SELECT sb_id FROM shopping_bag_item "
	                + "WHERE p_num = (select p_num from pop50 where sum = (select max(sum) from pop50))) "
	               + "GROUP BY p_num)R WHERE Ranking <= 5;";
	}
	System.out.println(Query);
	pstmt = con.prepareStatement(Query);
	rs=pstmt.executeQuery();
	
	while (rs.next()) {
		int p_num = rs.getInt("p_num");
		String q2 = "select p_name from product where p_num = " + p_num + ";";
		System.out.println(q2);
		PreparedStatement pstmt2 = con.prepareStatement(q2);
		ResultSet rs2 = pstmt2.executeQuery();
		rs2.next();
		String p_name = rs2.getString("p_name");
%>
		<li>&nbsp;
		<a href="item_info.jsp?p_name=<%=rs2.getString("p_name")%>">
		<%=rs2.getString("p_name") %></a>
		</li><br>
<%
	}
%>
</body>
</html>