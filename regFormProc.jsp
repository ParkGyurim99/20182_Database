<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String address = request.getParameter("address");
		String ph1 = request.getParameter("ph1");
		String ph2 = request.getParameter("ph2");
		String ph3 = request.getParameter("ph3");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		String name = request.getParameter("name");
		String job = request.getParameter("job");
		
		String query = "insert into customer values(";
		
		query += "'"+ id +"','" + pw + "','" + address + "','" + ph1 + "-" + ph2 + "-" + ph3 + "',";
		
		if(gender.equals(""))
			query += "null,";
		else
			query += "'" + gender + "',";
		
		age = age.toLowerCase();
		if(age.equals(""))
			query += "null,";
		else
			query += "'" + age + "',";
		
		name = name.toLowerCase();
		if(name.equals(""))
			query += "null,";
		else
			query += "'" + name + "',";
			
		job = job.toLowerCase();
		if(job.equals(""))
			query += "null,";
		else
			query += "'" + job;
		
		query +=  "');";
	
		System.out.println(query);
		
		Connection con = null;
		
		try {
			String url = "jdbc:mysql://localhost:3306/market";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			System.out.println("after forName");
			con = DriverManager.getConnection(url, "knu", "comp322");
			System.out.println("DBms connection success");
			System.out.println("DB load success");
			
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.executeUpdate(query);

			pstmt.close();
			//con.close();
			out.println("<script>alert('회원가입 완료'); location.href='login.jsp'</script>");
		}

		catch (Exception e) {
			e.printStackTrace();
		}
		
		PreparedStatement pstmt20 = con.prepareStatement("select reg_add_num from save;");
		ResultSet rs20 = pstmt20.executeQuery();
		rs20.next();
		int sb_num = rs20.getInt("reg_add_num");
		System.out.println(sb_num);
		
		query = "insert into shopping_bag values (" + sb_num + ", '" + address + "', NULL, " + id + ", NULL);";
		PreparedStatement pstmt21 = con.prepareStatement(query);
		pstmt21.executeUpdate(query);
		pstmt21.close();
		
		query = "update save set reg_add_num = reg_add_num + 1;";
		PreparedStatement pstmt22 = con.prepareStatement(query);
		pstmt22.executeUpdate(query);
		pstmt22.close();
		
	%>

</body>
</html>