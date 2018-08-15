<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page session ="true" language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        String username="root";
        String password="mysqlpass";
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/weiyidata",username,password);
        if(request.getParameter("delete")!=null)
        {
            int id=Integer.parseInt(request.getParameter("delete"));
            PreparedStatement pstmt=null; //create statement
            pstmt=con.prepareStatement("delete from data_1 where id=? "); //sql delete query
            pstmt.setInt(1,id);
            pstmt.executeUpdate(); //execute query

            con.close(); //close connection
        }
    }
    catch(Exception e)
    {
        out.println(e);
    }
%>

<%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        String username="root";
        String password="mysqlpass";
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/weiyidata",username,password);
        if(request.getParameter("delete")!=null)
        {
            int id=Integer.parseInt(request.getParameter("search"));
            PreparedStatement pstmt=null; //create statement
            pstmt=con.prepareStatement("delete from data_1 where id=? "); //sql delete query
            pstmt.setInt(1,id);
            pstmt.executeUpdate(); //execute query

            con.close(); //close connection
        }
    }
    catch(Exception e)
    {
        out.println(e);
    }
%>

 <html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>weiyi-tech data</title>
</head>
<body>
<h1> <a href="add.jsp"> Add Data </h1>
<h1> <a href="search.jsp"> Search </h1>

</body>
<form method="post">

  <table border="2">
    <tr>
      <td>id</td>
      <td>parameter_name</td>
      <td>parameter_value</td>
      <td>remark</td>
        <td>content</td>

    </tr>
    <%
      try
      {
        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost/weiyidata";
        String username="root";
        String password="mysqlpass";
        String query="select * from data_1";
        Connection conn=DriverManager.getConnection(url,username,password);
        Statement stmt=conn.createStatement();
        ResultSet rs=stmt.executeQuery(query);
        while(rs.next())
        {
    %>
    <tr>
      <td><%=rs.getInt("id") %></td>
      <td><%=rs.getString("parameter_name") %></td>
      <td><%=rs.getInt("parameter_value") %></td>
      <td><%=rs.getString("remark") %></td>
      <td><%=rs.getString("content") %></td>
      <td> <a href="?delete=<%=rs.getInt(1)%> ">Delete</a> </td>
      <td> <a href="edit.jsp?edit=<%=rs.getInt(1)%> ">Edit</a> </td>


    </tr>
    <%

      }
    %>
  </table>
  <%
      rs.close();
      stmt.close();
      conn.close();
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }




  %>

</form>
</html>