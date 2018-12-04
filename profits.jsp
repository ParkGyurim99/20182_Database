<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 확인</title>
</head>
<body>
<h1>매출 확인</h1>
<a href="check_profit.jsp"> < 매출 확인으로 이동 </a><hr>
<%	
	Connection con = null;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/market", "knu", "comp322");
	
	
	request.setCharacterEncoding("utf-8");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String period = request.getParameter("period");
	
	Integer int_year = Integer.parseInt(year);
	Integer int_month = Integer.parseInt(month);
		
	String Query;
	if (period.equals("Month")) {
		Query = "select sum(total) from shopping_bag where DATE(sb_date) BETWEEN '" 
			+ year + "-" + (int_month - 1) + "-31' AND '" + year + "-" + (int_month + 1) + "-1'";
		switch (int_month) {
		case 1:
			Query = "select sum(total) from shopping_bag where DATE(sb_date) BETWEEN '" 
					+ (int_year - 1) + "-12-31' AND '" + year + "-" + (int_month + 1) + "-1'";
			break;
		case 2:
			Query = "select sum(total) from shopping_bag where DATE(sb_date) BETWEEN '" 
					+ year + "-1-31' AND '" + year + "-" + (int_month + 1) + "-1'";
			break;
		case 3:
			Query = "select sum(total) from shopping_bag where DATE(sb_date) BETWEEN '" 
					+ year + "-2-28' AND '" + year + "-" + (int_month + 1) + "-1'";
			break;
		case 4:
			Query = "select sum(total) from shopping_bag where DATE(sb_date) BETWEEN '" 
				+ year + "-3-31' AND '" + year + "-" + (int_month + 1) + "-1'";
			break;
		case 5:
			Query = "select sum(total) from shopping_bag where DATE(sb_date) BETWEEN '" 
					+ year + "-4-30' AND '" + year + "-" + (int_month + 1) + "-1'";
			break;
		case 6:
			Query = "select sum(total) from shopping_bag where DATE(sb_date) BETWEEN '" 
					+ year + "-5-31' AND '" + year + "-" + (int_month + 1) + "-1'";
			break;
		case 7:
			Query = "select sum(total) from shopping_bag where DATE(sb_date) BETWEEN '" 
					+ year + "-6-30' AND '" + year + "-" + (int_month + 1) + "-1'";
			break;
		case 8:
			Query = "select sum(total) from shopping_bag where DATE(sb_date) BETWEEN '" 
					+ year + "-7-31' AND '" + year + "-" + (int_month + 1) + "-1'";
			break;
		case 9:
			Query = "select sum(total) from shopping_bag where DATE(sb_date) BETWEEN '" 
					+ year + "-8-31' AND '" + year + "-" + (int_month + 1) + "-1'";
			break;
		case 10:
			Query = "select sum(total) from shopping_bag where DATE(sb_date) BETWEEN '" 
					+ year + "-9-30' AND '" + year + "-" + (int_month + 1) + "-1'";
			break;
		case 11:
			Query = "select sum(total) from shopping_bag where DATE(sb_date) BETWEEN '" 
					+ year + "-10-31' AND '" + year + "-" + (int_month + 1) + "-1'";
			break;
		case 12:
			Query = "select sum(total) from shopping_bag where DATE(sb_date) BETWEEN '" 
					+ year + "-11-30' AND '" + (int_year + 1) + "-1-1'";
			break;
		}
	}
	else if (period.equals("Day")) {
		Query = "select sum(total) from shopping_bag where DATE(sb_date) = '" + year + "-" + month + "-" + day + "';";
	}
	else {
		Query = "select sum(total) from shopping_bag where DATE(sb_date) is not NULL;";
	}
	
	System.out.println(Query);
	
	pstmt = con.prepareStatement(Query);
	rs=pstmt.executeQuery();
	rs.next();
	long total_profit = rs.getLong("sum(total)");
	
	String str = String.format("%,d", total_profit);
	
	if (period.equals("Month")) {
		out.println("<br>" + year + "년 " + month + "월 매출은 <b>" + str + "원</b> 입니다.");
	}
	else if (period.equals("Day")) {
		out.println("<br>" + year + "년 " + month + "월 " + day + "일 매출은 <b>" + str + "원</b> 입니다.");
	}
	else {
		out.println("<br>총 매출은 <b>" + str + "원</b> 입니다.");
	}
%>

</body>
</html>