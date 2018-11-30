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

<% 
	request.setCharacterEncoding("utf-8");
	Integer user_id = (Integer)session.getAttribute("id");
	String password = request.getParameter("password");
	String check_password = request.getParameter("check_password");
	
	int id = user_id.intValue();
	
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
			//rs.getString(1);

			if (password.equals(check_password))
			{
				sql = "update customer set pw=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, password);
				pstmt.executeUpdate();
				%>
				<script type="text/javascript">
				alert("비밀번호 수정하였습니다.");
				location.href = "info.jsp";
				</script>
				<%		
			}
			
			
			else
			{
				%>
				<script type="text/javascript">
				alert("비밀번호를 다시 입력해주세요.");
				history.back();
				</script>
				<%
			}
		}
		
		else
		{
			%>
			<script type="text/javascript">
			alert("id가 없습니다.");
			history.back();
			</script>
			<%
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