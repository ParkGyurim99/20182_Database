<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html; charset="UTF-8">
<title>고객 정보</title>
</head>
<body>
<h1> 회원정보조회 </h1>
<a href="main.jsp"> < 메인 화면으로 이동</a><br><br>
<b> < 회원정보 > </b> 
<hr>
<% 

	request.setCharacterEncoding("utf-8");
	Integer user_id = (Integer)session.getAttribute("id");
	int id = user_id.intValue();
	
	if (user_id == null)response.sendRedirect("login.jsp");
	request.setCharacterEncoding("utf-8");

	ResultSet rs = null;
	Connection con = null;
	String url = "jdbc:mysql://localhost:3306/market";
	PreparedStatement pstmt = null;
	String sql = "";

	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		System.out.println("after forName");
		con = DriverManager.getConnection(url, "knu", "comp322");
		System.out.println("DBms connection success");
		System.out.println("DB load success");
		
		sql = "select* from customer where id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, id);
		
		rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			%>
			<li><b>고객ID :</b> <%= rs.getString("id") %></li><br>
			<li><b>비밀번호 :</b> <%= rs.getString("pw") %></li><br>
			<li><b>주소 :</b> <%= rs.getString("address") %></li><br>
			<li><b>휴대폰 :</b> <%= rs.getString("phone")%></li><br>
			<li><b>성별 :</b> <%= rs.getString("sex") %></li><br>
			<li><b>나이 :</b> <%= rs.getString("age") %></li><br>
			<li><b>이름 :</b> <%= rs.getString("name") %></li><br>
			<li><b>직업 :</b> <%= rs.getString("job") %></li><br><%
		}
	}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		finally
		{
			if (rs != null)try{rs.close();}catch(SQLException ex){}
			if (pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if (con != null)try{con.close();}catch(SQLException ex){}
		}

%>

<a href="updatePassword.jsp">비밀번호수정</a>&nbsp;
<a href="updateForm.jsp">회원정보수정</a>

</body>
</html>