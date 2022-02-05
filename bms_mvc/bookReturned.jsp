<html>

<head>
    <title>Book Returned</title>




    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

    <link rel="stylesheet" href="styles.css">


    <script language="JavaScript" type="text/javaScript">

    </script>
</head>

<body>
    <%@page import="MyPackage.*, java.util.*"%>
        <%
		String status = (String)session.getAttribute("status");
		if("loggedin".equals(status))
            	{
			String role=(String)session.getAttribute("role");
			if("staff".equals(role)){
				RequestDispatcher rd = request.getRequestDispatcher("staffHome.jsp");
				rd.include(request, response);
     			}
			else if("admin".equals(role)){
				RequestDispatcher rd = request.getRequestDispatcher("adminHome.jsp");
				rd.include(request, response);
			}
			bookReturnedBean brb=(bookReturnedBean)session.getAttribute("result");
			if(brb!=null){%>
            <div class="bookReturnedDiv">
                <h2 style="margin-top:3%">Book Returned</h2>
                <table class="bookReturned">
                    <tr>
                        <th>Name: </th>
                        <%out.print("<td>"+brb.getFname()+" "+brb.getLname()+"</td>");%>
                    </tr>
                    <tr>
                        <th>Book Name: </th>
                        <%out.print("<td>"+ brb.getBname()+"</td>");%>
                    </tr>
                    <tr>
                        <th>Author Name: </th>
                        <%out.print("<td>"+ brb.getAname()+"</td>");%>
                    </tr>
                    <tr>
                        <th>CNIC: </th>
                        <%out.print("<td>"+ brb.getCnic()+"</td>");%>
                    </tr>
                    <tr>
                        <th>Issue Date: </th>
                        <%out.print("<td>"+ brb.getIdate()+"</td>");%>
                    </tr>
                    <tr>
                        <th>Due Date: </th>
                        <%out.print("<td>"+ brb.getDdate()+"</td>");%>
                    </tr>
                    <tr>
                        <th>Return Date: </th>
                        <%out.print("<td>"+ brb.getRdate()+"</td>");%>
                    </tr>
                    <tr>
                        <th>Fine: </th>
                        <%out.print("<td>"+ brb.getFine()+"</td>");%>
                    </tr>
                </table>
            </div>
            <% session.setAttribute("result",null);}
		}
		else{
		    session.setAttribute("msg","You are not logged in. Please login first.");
        	    response.sendRedirect("login.jsp");
    
   		 }%>
</body>

</html>