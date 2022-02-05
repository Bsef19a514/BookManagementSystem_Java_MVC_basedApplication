<head>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">

    <title>Staff Home</title>
    <script language="JavaScript" type="text/javaScript">

        function validateSearch()
	{
		if(document.searchBook.sbook.value==""||document.searchBook.sbook.value==null)
		{
			document.getElementById("error_sbook").innerHTML="*Please enter Book name to search";
			return false;
		}
		else
		{
			document.getElementById("error_sbook").innerHTML="";
        		return true;
		}
	}
    </script>
</head>

<body>
    <%
		String status = (String)session.getAttribute("status");
		if("loggedin".equals(status))
            	{
			String role=(String)session.getAttribute("role");
			if("admin".equals(role)){
				session.setAttribute("msg","You are not authorized to access this page");
				response.sendRedirect("adminHome.jsp");
			}
			else if("staff".equals(role))
			{%>
                <nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">
                    <div class="container-fluid">
                        <div class="profile">
                            <p><u><% out.print("Staff"); %></u><br>
                                <% out.print((String)session.getAttribute("fname")+" "+(String)session.getAttribute("lname")); %>
                            </p>
                        </div>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				  </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0" id="menus">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="staffHome.jsp">Home</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link active" href="issueBook.jsp">Issue Book</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" href="returnBook.jsp">Return Book</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" href="logout.jsp">Logout</a>
                                </li>

                            </ul>

                            <form class="d-flex" name="searchBook" method="POST" action="ControllerServlet" onsubmit="return validateSearch()">
                                <input class="form-control me-2" name="sbook" type="text" placeholder="Search Book/Author" aria-label="Search">
                                <input type="submit" class="btn btn-outline-primary" name="action" value="Search"></input>
                            </form>
                        </div>
                    </div>
                </nav>
                <% if(session.getAttribute("msg")!=null){
			String mg=(String)session.getAttribute("msg");
			out.print("<p style='color:red; margin-left: auto; margin-right: auto;text-align: center;'>"+mg+"</p>");
            		session.setAttribute("msg",null);
            	}%>
                    <div style="color:red ;text-align:right; margin-left: auto;margin-right: 4%;"><span id="error_sbook"></span></div>
	<%}
		}
		else{
			session.setAttribute("msg","You are not logged in. Please login first.");
			response.sendRedirect("login.jsp");
    }%>
</body>

</html>