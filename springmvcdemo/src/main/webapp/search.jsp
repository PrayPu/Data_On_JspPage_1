<%@ page session ="true" contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>



<html>
<head>
    <title>Adding Data</title>
</head>
<body>

</body>

<form method="post" name="search_window">

    <h1>Search</h1>


    <table>
        <tr>
            <td> keyword <td>
            <td> <input type="text" name="student_id"> </td>
        </tr>
        <tr>
            <td> <input type="submit" name="btn_add" value="search"> </td>
        </tr>
    </table>


    <h1><a href="index.jsp">Back</a></h1>

</form>

<table border="2">
    <tr>
        <td>id</td>
        <td>parameter_name</td>
        <td>parameter_value</td>
        <td>remark</td>
        <td>content</td>

    </tr>
    <%
     if(request.getParameter("btn_add")!=null)
        {
    String value=request.getParameter("student_id");

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/weiyidata","root", "mysqlpass");
    ResultSet rs;
   // Statement st = conn.createStatement();
//    rs = st.executeQuery("select * from data_1 where parameter_name LIKE "+value+"" );
//    rs = st.executeQuery("select * from data_1 where id=value" );
//    st.setString(1, value);

     PreparedStatement pstmt=null;
     pstmt=conn.prepareStatement("select * from data_1 where id=? or parameter_name=? or parameter_value=? or remark=? "); //sql insert query
     pstmt.setString(1,value);
     pstmt.setString(2,value);
     pstmt.setString(3,value);
     pstmt.setString(4,value);
     rs = pstmt.executeQuery();

    if(rs.next()){
%>
<%--<tr><td>Name: </td><td><input type="text" value="<%=rs.getString("parameter_name")%>"/> </td></tr>--%>
<%--<td><%=rs.getString("content") %></td>--%>
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
    }
%>
</table>

<%--<form method="post" name="search_display">--%>

    <%--<h1>Search</h1>--%>

        <%--<%--%>
            <%--String value=request.getParameter("student_id");;--%>
            <%--int v=Integer.parseInt(value);--%>
            <%--Class.forName("com.mysql.jdbc.Driver");--%>
            <%--Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/weiyidata","root", "mysqlpass");--%>
            <%--Statement st=conn.createStatement();--%>
            <%--ResultSet rs = st.executeQuery("select * from student where student_id='"+v+"'");--%>
            <%--if(rs.next()){--%>
        <%--%>--%>
        <%--<tr><td>Name: </td><td><input type="text" value="<%=rs.getString("parameter_name")%>"/> </td></tr>--%>
        <%--<%--%>
            <%--}--%>
        <%--%>--%>


    <%--<h1><a href="index.jsp">Back</a></h1>--%>

<%--</form>--%>