<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html; charset="UTF-8">
</head>
<body>

<% 
	request.setCharacterEncoding("utf-8");
	Integer user_id = (Integer)session.getAttribute("id");
	int id = user_id.intValue();
	
	String address = request.getParameter("address");
	String ph1 = request.getParameter("ph1");
	String ph2 = request.getParameter("ph2");
	String ph3 = request.getParameter("ph3");
	String age = request.getParameter("age");
	String name = request.getParameter("name");
	String job = request.getParameter("job");
	String phone = ph1 + "-" + ph2 + "-" + ph3;
	
	if (user_id == null) response.sendRedirect("login.jsp");
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
		
		sql = "select id from customer where id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, id);
		
		rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			rs.getString(1);
			
			sql = "update customer set address=?, phone=?, age=?, job=?  where id=?";
			pstmt=con.prepareStatement(sql);
		     pstmt.setString(1, address);
		     pstmt.setString(2, phone);
		     pstmt.setString(3, age);
		     pstmt.setString(4, job);
		     pstmt.setInt(5, id);
		
			pstmt.executeUpdate();
			%>
			<script type="text/javascript">
			alert("회원정보를 수정하였습니다.");
			location.href = "info.jsp";
			</script>
			<% 
		}
		
		else
		{
			out.println("id가 존재하지 않습니다");
		}
		
	}
	
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	finally
	{
	}
	%>
</body>
</html>