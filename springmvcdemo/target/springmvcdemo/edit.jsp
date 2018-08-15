<%@ page import="java.sql.*" %>

<%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");

        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/weiyidata","root","mysqlpass");

        if(request.getParameter("btn_update")!=null)
        {
//            int hide;
//            hide=Integer.parseInt(request.getParameter("txt_hide")); //it is hidden id get for update record
            String parameter_name=request.getParameter("paraname");
            String parameter_value=request.getParameter("paraval");
            String remark=request.getParameter("remark_");

            PreparedStatement pstmt=null;

            pstmt=con.prepareStatement("update data_1 set parameter_name=?, parameter_value=? where remark=?"); //sql update query
            pstmt.setString(1,parameter_name);
            pstmt.setString(2,parameter_value);
            pstmt.setString(3,remark);
            pstmt.executeUpdate(); //execute query

            con.close(); //connection close

            System.out.println("Update Successfully"); //after update record successfully message
        }

    }
    catch(Exception e)
    {
        System.out.println(e); 
    }

%>

<form method="post" name="myform">

         <h1>Update Record</h1>
    <table>
        <%
            try
            {
                Class.forName("com.mysql.jdbc.Driver"); //load driver

                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/weiyidata","root","mysqlpass");

                if(request.getParameter("edit")!=null)
                {
                    int id=Integer.parseInt(request.getParameter("edit"));

                    PreparedStatement pstmt=null; // create statement

                    pstmt=con.prepareStatement("select * from data_1 where id=?"); // sql select query
                    pstmt.setInt(1,id);
                    ResultSet rs=pstmt.executeQuery(); // execute query store in resultset object rs.

                    while(rs.next())
                    {
                        id=rs.getInt(1);
                        String parameter_name=rs.getString(2);
                        String parameter_value=rs.getString(3);
                        String remark=rs.getString(4);
        %>
        <tr>
            <td>parameter_name</td>
            <td><input type="text" name="parameter_name" value="<%=parameter_name %>"></td>
        </tr>

        <tr>
            <td>parameter_value</td>
            <td><input type="text" name="parameter_value" value="<%=parameter_value %>"></td>
        </tr>

        <tr>
            <td>remark</td>
            <td><input type="text" name="remark" value="<%=remark %>"></td>
        </tr>

        <tr>
            <td><input type="submit" name="btn_update" value="Update"></td>
        </tr>

        <input type="hidden" name="txt_hide" value="<%=id %>">
        <%
                    }
                }
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
        %>
    </table>

        <h1><a href="index.jsp">Back</a></h1>

</form>