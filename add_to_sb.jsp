<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
     
 <%@ page language="java" import="java.text.*,java.sql.*"%>
     
 <!DOCTYPE html>
 <html>
 <head>
 <meta charset="UTF-8">
 <title>Add to Shopping Bag</title>
 </head>
 <body>

 <%
 	Integer id = (Integer)session.getAttribute("id");
 	if(id == null)
 	response.sendRedirect("login.jsp");
 	
 	request.setCharacterEncoding("utf-8");
 	String quantity = request.getParameter("p_quantity");
  	String p_name = request.getParameter("p_name"); 	
  
 	//out.println(id + "   " + quantity + "      " + p_name);
 	System.out.println(id + "   " + quantity + "      " + p_name);

 	String query = "insert into shopping_bag_item values (" + (id + 1000) 
 			+ ", (select p_num from product where p_name = \"" + p_name + "\"), " + quantity 
 			+ ", " + id + ");";
 			
 	System.out.println(query);
 	
 	Connection con = null;
 	
 	try {
 		Class.forName("com.mysql.jdbc.Driver").newInstance();
 		con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/market", "knu", "comp322");
 		
 		PreparedStatement pstmt = con.prepareStatement(query);
 		pstmt.executeUpdate(query);

 		pstmt.close();
 		con.close();
 		out.println("<script>alert('상품이 장바구니에 담겼습니다. 장바구니로 이동합니다.'); location.href='shopping_bag.jsp'</script>");
 	}

 	catch (Exception e) {
 		System.out.println("ddd");
 	}
 %>

 </body>
 </html>