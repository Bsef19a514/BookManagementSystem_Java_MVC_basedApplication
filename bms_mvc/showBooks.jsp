<html>

<head>
    <title>Show Books</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">

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
			ArrayList<searchBean> sb=(ArrayList<searchBean>)session.getAttribute("result");
			if(sb!=null){%>
            		<div class="showBooksDiv">
                	<h2 style="margin-top:3%">Search Results</h2>
                	<table class="showBooksTable">
                	    <tr>
                	        <th>Book Name </th>
                	       	<th>Author Name</th>
				<th>Total Copies</th>
				<th>Remaining Copies</th>
                		    </tr>
				<% for (int i=0;i<sb.size();i++){
					searchBean b=sb.get(i);%>
					<tr>
                    			<%out.print("<td>"+b.getBname()+"</td>");		
					out.print("<td>"+b.getAname()+"</td>");
					out.print("<td>"+b.getTQuantity()+"</td>");
					out.print("<td>"+b.getRQuantity()+"</td>");%>
					</tr>
				<%}%>
                	</table>
            		</div>
            		<% session.setAttribute("result",null);
			}
		}
		else{
		    session.setAttribute("msg","You are not logged in. Please login first.");
        	    response.sendRedirect("login.jsp");
    
   		 }%>
</body>

</html>