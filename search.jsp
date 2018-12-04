<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page language="java" import="java.text.*,java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
</head>

<body>
<form action="itemlist.jsp" name="form" method="post">
<h1> 검색 결과 </h1>
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

	
	request.setCharacterEncoding("UTF-8");
	String search = request.getParameter("search");
	
	String query = "select p_name, p_price from product where c_name like '%" + search 
			+ "%' or p_name like '%" + search + "%';";
	out.println("<b>' " + search + " ' 의 검색결과</b><br><br>");
	System.out.println(query);
	System.out.println(search);
	try{	
		out.println("<table border=\"1\">");
		pstmt = con.prepareStatement(query);
		rs=pstmt.executeQuery();
		
		if (rs.next() == false) {
			out.println("' " + search + " ' 에 대한 검색결과가 없습니다.<br><br>");
		}
		else {
		out.println("<tr>");
		out.println("<td><b>상품 이름</b></td>");
		out.println("<td><b>상품 가격</b></td>");
		out.println("</tr>");
		System.out.println("상품이름\t\t상품가격");
		
		do {
			String p_name = rs.getString("p_name");
			int p_price = rs.getInt("p_price");
			String job = (String)session.getAttribute("job");
			System.out.println(p_name +"\t" + p_price);
			out.println("<tr>");
			//out.println("<td>" + p_name + "</td>");
			
			if (job.equals("관리자")){
				//out.println("<td>" + p_name + "</td>");
				%>
				<td>
				
				<a href="update_item_info.jsp?p_name=<%=rs.getString("p_name")%>">
				<%=rs.getString("p_name") %></a>
				</td>
				<%
				}
			
			else{
			%>
			<td>
			<a href="item_info.jsp?p_name=<%=rs.getString("p_name")%>">
			<%=rs.getString("p_name") %></a>
			</td>
	
			<%
			}
			out.println("<td>" + p_price + "</td>");
			out.println("</tr>");
			
		} while (rs.next());
		out.println("</table>");
		}
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