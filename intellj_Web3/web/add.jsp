<%--
  Created by IntelliJ IDEA.
  User: Pray
  Date: 01/08/2018
  Time: 23:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");

        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/weiyidata","root","mysqlpass"); //create connection

        if(request.getParameter("btn_add")!=null)
        {
            String parameter_name=request.getParameter("paraname");
            String parameter_value=request.getParameter("paraval");
            String remark=request.getParameter("remark_");


            PreparedStatement pstmt=null;

            pstmt=con.prepareStatement("insert into data_1(parameter_name,parameter_value,remark) values(?,?,?)"); //sql insert query
            pstmt.setString(1,parameter_name);
            pstmt.setString(2,parameter_value);
            pstmt.setString(3,remark);
            pstmt.executeUpdate(); //execute query

            con.close();  //close connection

            out.println("Insert Successfully");
        }

    }
    catch(Exception e)
    {
        out.println(e);
    }

%>

<html>
<head>
    <title>Adding Data</title>
</head>
<body>

</body>
<form method="post" name="myform">

         <h1>Insert Record</h1>

            <table>
                <tr>
                    <td> parameter_name <td>
                    <td> <input type="text" name="paraname"> </td>
                </tr>
                <tr>
                    <td> parameter_value <td>
                    <td> <input type="int" name="paraval"> </td>
                </tr>
                <tr>
                    <td> remark <td>
                    <td> <input type="text" name="remark_"> </td>
                </tr>
                <tr>
                    <td> <input type="submit" name="btn_add" value="Insert"> </td>
                </tr>
            </table>
                 <h1> <a href="index.jsp"> Back </a> </h1>

</form>
</html>
