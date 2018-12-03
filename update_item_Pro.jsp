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
	
	String p_num = request.getParameter("p_num");
	String s_name = request.getParameter("s_name");
	String p_quantity = request.getParameter("p_quantity");
	
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
			
			sql = "update sales set quantity=? where s_name=? and p_num=?";
			pstmt=con.prepareStatement(sql);
		    pstmt.setString(1, p_quantity);
		    pstmt.setString(2, s_name);
		    pstmt.setString(3, p_num);

			pstmt.executeUpdate();
			%>
			<script type="text/javascript">
			alert("제품 재고를 수정하였습니다.");
			location.href = "update_item_info.jsp";
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