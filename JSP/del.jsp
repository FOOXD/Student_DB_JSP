<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>del</title>
</head>
<body>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentDB?useUnicode=true&characterEncoding=utf-8","root","aqst98987");
		Statement stmt = con.createStatement();
		String id = request.getParameter("id");
		String str = "delete from students where number='"+id+"'";
		stmt.executeUpdate(str);
		System.out.print("删除成功，正在返回");
		stmt.close();
		con.close();		
		response.setHeader("refresh", "1;url=index.jsp");
	%>
</body>
</html>