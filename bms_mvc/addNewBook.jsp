<html>

<head>
    <title>Add new Book</title>

    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
        integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="styles.css">

    <script language="JavaScript" type="text/javaScript">
        function validate(){ var flag=false; if(document.addNewBook.bname.value==""||document.addNewBook.bname.value==null){ document.getElementById("error_bname").innerHTML="*Please enter Book name."; flag=true; } else{ document.getElementById("error_bname").innerHTML="";
        } if(document.addNewBook.aname.value==""||document.addNewBook.aname.value==null){ document.getElementById("error_aname").innerHTML="*Please enter author's name."; flag=true; } else{ document.getElementById("error_aname").innerHTML=""; } if(document.addNewBook.quantity.value==""){
        document.getElementById("error_quantity").innerHTML="*Please enter number of copies of book."; flag=true; } else{ document.getElementById("error_quantity").innerHTML=""; } if( flag==true){ return false; } else{ return true; } }
    </script>
</head>

<body>
    <%
		String status = (String)session.getAttribute("status");
		if("loggedin".equals(status))
            	{
			String role=(String)session.getAttribute("role");
			if("staff".equals(role)){
				session.setAttribute("msg","You are not authorized to access this page");
				response.sendRedirect("staffHome.jsp");
		}
			else if("admin".equals(role)){
				RequestDispatcher rd = request.getRequestDispatcher("adminHome.jsp");
				rd.include(request, response);
				%>

            <h1 class="H1" id="mainHeading">Add a new Book</h1>
            <br>
            <div class="form">
                <form name="addNewBook" method="POST" action="ControllerServlet" onsubmit="return validate()">
                    <label class="form-label">Book Name:</label>
                    <input type="text" class="form-control" name="bname"></input>
                    <span id="error_bname" style="color:red"></span>
                    <br>
                    <label class="form-label">Author Name:</label>
                    <input type="text" class="form-control" name="aname"></input>
                    <span id="error_aname" style="color:red"></span>
                    <br>
                    <label class="form-label">No of Copies: </label>
                    <input type="text" class="form-control" name="quantity"></input>
                    <span id="error_quantity" style="color:red"></span>
                    <br>
                    <br>
                    <input type="submit" class="sub_button" name="action" value="Add Book"></input>
                </form>
                <%if(session.getAttribute("msg")!=null){
		String msg=(String)session.getAttribute("msg");%>
                    <p style='color:red; margin-left: auto; margin-right: auto;text-align: center;'>
                        <% out.print(msg); %>
                    </p>
                    <%}%>
            </div>
            <%}
	}
	else{
		session.setAttribute("msg","You are not logged in. Please login first.");%>
                <jsp:forward page="login.jsp" />
                <%}%>


</body>

</html>