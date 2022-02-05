<html>

<head>
    <title>Add new Account</title>


    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="styles.css">
    <script language="JavaScript" type="text/javaScript">
        function validate(){ var flag=false; if(document.addNewAccount.fname.value==""||document.addNewAccount.fname.value==null){ document.getElementById("error_fname").innerHTML="*Please enter First name."; flag=true; } else{ document.getElementById("error_fname").innerHTML="";
        } if(document.addNewAccount.lname.value==""||document.addNewAccount.lname.value==null){ document.getElementById("error_lname").innerHTML="*Please enter Last name."; flag=true; } else{ document.getElementById("error_lname").innerHTML=""; } if(document.addNewAccount.password.value==""){
        document.getElementById("error_password").innerHTML="*Please enter password."; flag=true; } else{ document.getElementById("error_password").innerHTML=""; } if(document.addNewAccount.password.value!=document.addNewAccount.confirm_password.value){
        document.getElementById("error_confirmPassword").innerHTML="*Passwords does not match."; flag=true; } else{ document.getElementById("error_confirmPassword").innerHTML=""; } if ( document.addNewAccount.email.value ==""||document.addNewAccount.email.value==null
        ) { document.getElementById("error_email").innerHTML="*Please enter email address."; flag=true; } else if(document.addNewAccount.email.value != "") { var g=document.addNewAccount.email.value; var at=g.indexOf("@"); dot=g.lastIndexOf("."); if(at
        <=0 || dot<=0 || dot<=at+1 || dot==g.length-1) { document.getElementById( "error_email").innerHTML="*invalid email address" ; flag=true; } else{ document.getElementById( "error_email").innerHTML="" ; } } if( flag==true){ return false; } else{ return true;
            } } </script>
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
            <div class="book_issue_div">
                <form name="addNewAccount" method="POST" action="ControllerServlet" onsubmit="return validate()">
                    <h1 class="H1" id="mainHeading">Add New Account</h1>
                    <table class="issue" id=" issue">
                        <tr>
                            <td><label class="form-label">First Name:</label></td>
                            <td><input type="text" class="form-control" name="fname" placeholder="First Name"></input>
                            </td>
                            <td><label class="form-label">Last Name:</label></td>
                            <td><input type="text" class="form-control" name="lname" placeholder="Last Name"></input>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><span id="error_fname" style="color:red"></span></td>
                            <td></td>
                            <td><span id="error_lname" style="color:red"></span></td>
                        </tr>
                        <tr>

                            <td><label class="form-label">Email:</label></td>
                            <td><input type="text" class="form-control" name="email"></input>
                            </td>
                            <td><label class="form-label">Role:</label></td>
                            <td><select name="role" class="form-control">
								<option value="admin">Admin</option>
								<option value="staff">Staff</option>
								</select></label>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><span id="error_email" style="color:red"></span></td>
                            <td></td>
                            <td><span id="error_role" style="color:red"></span></td>
                        </tr>
                        <tr>
                            <td><label class="form-label">Password:</label></td>
                            <td><input type="password" class="form-control" name="password"></input>
                            </td>
                            <td><label class="form-label">Confirm Password:</label></td>
                            <td><input type="password" class="form-control" name="confirm_password"></input>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><span id="error_password" style="color:red"></span></td>
                            <td></td>
                            <td><span id="error_confirmPassword" style="color:red"></span></td>
                        </tr>
                    </table>
                    <input type="submit" class="issue_button" name="action" value="Add Account"></input>
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