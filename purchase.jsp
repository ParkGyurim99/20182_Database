<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*,java.util.Calendar,java.text.SimpleDateFormat"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 </title>
</head>
<body>
<h1>주문 완료</h1>
<b>주문이 완료되었습니다. </b><br><br>
<a href="main.jsp"> < 메인 화면으로 이동 </a><br><br>
<b> < 주문 내역 > </b><hr>

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
	request.setCharacterEncoding("utf-8");
		
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
		out.println("<td></td><td></td><td></td><td>총 가격</td><td>" + sum + "원</td>");
	}
	catch (Exception e){
		System.out.println("fail : " + e.toString());
	}	
	
	
	PreparedStatement pstmt9 = con.prepareStatement("select purchase_add_num from save;");
	ResultSet rs9 = pstmt9.executeQuery();
	rs9.next();
	int sb_num = rs9.getInt("purchase_add_num");
	
	
	
	//db에 추가
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Calendar c = Calendar.getInstance();
	String today = sdf.format(c.getTime());
	
	PreparedStatement pstmt3 = con.prepareStatement("select delivery from shopping_bag where sb_id = " + (id+1000) + ";");
	ResultSet rs3 = pstmt3.executeQuery();
	rs3.next();
	String d_loc = rs3.getString("delivery");
	
	query = "insert into shopping_bag values (" + sb_num + ", '" + d_loc + "', " + sum + ", " + id + ", '" + today + "');";
	System.out.println(query);
	PreparedStatement pstmt4 = con.prepareStatement(query);
 	pstmt4.executeUpdate(query);
	pstmt4.close();

	
	PreparedStatement pstmt5 = con.prepareStatement("select p_num, sb_id from shopping_bag_item where sb_id = " + (id+1000) + ";");
	ResultSet rs5 = pstmt5.executeQuery();
	while (rs5.next()) {
		int pn = rs5.getInt("p_num");
		int si = rs5.getInt("sb_id");
		
		query = "update shopping_bag_item set sb_id = " + sb_num + " where p_num = " + pn + " and sb_id = " + (id + 1000) + ";";
		System.out.println(query);
		PreparedStatement pstmt6 = con.prepareStatement(query);
		pstmt6.executeUpdate(query);
	}
	
	query = "update save set purchase_add_num = purchase_add_num + 1;";
	PreparedStatement pstmt10 = con.prepareStatement(query);
	pstmt10.executeUpdate(query);
	pstmt10.close();
%>

</body>
</html>