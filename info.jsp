<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html; charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1> 회원정보조회 </h1>
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
			ID : <%= rs.getString("id") %><br>
			비밀번호 : <%= rs.getString("pw") %><br>
			주소 : <%= rs.getString("address") %><br>
			휴대폰 : <%= rs.getString("phone")%><br>
			성별 : <%= rs.getString("sex") %><br>
			나이 : <%= rs.getString("age") %><br>
			이름 : <%= rs.getString("name") %><br>
			직업 : <%= rs.getString("job") %><br><%
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
<a href="updateForm.jsp">회원정보수정</a>
<a href="main.jsp">메인화면으로</a>

</body>
</html>