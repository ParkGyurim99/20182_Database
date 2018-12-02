<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html; charset="UTF-8">
</head>
<body>

    <h1> 로그인 체크 페이지 </h1>
<%    
	request.setCharacterEncoding("utf-8");
	String user_id = request.getParameter("id");
	String user_pass = request.getParameter("pw");
	
	if (user_id == null || user_pass == null)
	{
		%>
			<script type = "text/javascript">
			alert("id 또는 비밀번호가 입력되지 않았습니다.");
			history.back();
			</script>
		<%
	}
	
	int id = Integer.parseInt(user_id);
	int pass = Integer.parseInt(user_pass);

	ResultSet rs = null;
	Connection con = null;
	String url = "jdbc:mysql://localhost:3306/market";
	PreparedStatement pstmt = null;
	String sql = "";
	
	try{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		System.out.println("after forName");
		con = DriverManager.getConnection(url, "knu", "comp322");
		System.out.println("DBms connection success");
		System.out.println("DB load success");
		
		sql = "select id, pw, job from customer where id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, id);
		
		rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			rs.getInt(1);
			int dbPass = rs.getInt("pw");
			String dbjob = rs.getString("job");
			session.setAttribute("id", id);
			session.setAttribute("job", dbjob);
			
			if(dbjob.equals("관리자"))
			{
				%>
				<script type = "text/javascript">
				alert("관리자 세션값 생성");
				location.href = "managerMain.jsp";
				</script>
				<% 
			}
			else if (pass == dbPass)
			{
				%>
				<script type = "text/javascript">
				alert("세션값 생성");
				location.href = "main.jsp";
				</script>
				<% 
			}
			
			else
			{
				%>
				<script type="text/javascript">
				alert("비밀번호 틀렸습니다.");
				history.back();
				</script>
				<%
			}
		}
		
		else
		{
			%>
			<script type = "text/javascript">
			alert("id가 존재하지 않습니다");
			history.back();
			</script><% 
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

</body>
</html>