<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page language="java" import="java.text.*,java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category : Beef</title>
</head>

<body>
<form action="itemlist.jsp" name="form" method="post">
<h1> 정육류 소고기 </h1>
	<tr>
		<td height="60%" align="center" valign="top">
		<hr>
		</td>
	</tr>
	
	<%
	Connection con = null;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/market", "knu", "comp322");

	String query = "select p_name, p_price from product where c_name = \"정육류 소고기\";";
	
	try{	
		out.println("<table border=\"1\">");
		pstmt = con.prepareStatement(query);
		rs=pstmt.executeQuery();
		out.println("<tr>");
		out.println("<td><b>상품 이름</b></td>");
		out.println("<td><b>상품 가격</b></td>");
		out.println("</tr>");
		System.out.println("상품이름\t\t상품가격");
		
		while (rs.next()) {
			String p_name = rs.getString("p_name");
			int p_price = rs.getInt("p_price");
			System.out.println(p_name +"\t" + p_price);
			out.println("<tr>");
			//out.println("<td>" + p_name + "</td>");
	%>
			<td>
			<a href="item_info.jsp?p_name=<%=rs.getString("p_name")%>">
			<%=rs.getString("p_name") %></a>
			</td>
	
	<%			out.println("<td>" + p_price + "</td>");
			out.println("</tr>");
		}
		out.println("</table>");

	}
	catch (Exception e){
		System.out.println("fail : " + e.toString());
	}
	%>
<br>
<input type = "submit" value = "카테고리로 돌아가기">

</form>
</body>
</html>