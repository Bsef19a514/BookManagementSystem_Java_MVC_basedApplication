<html>

<head>
    <title>Login</title>


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">


    <script language = "JavaScript" type = "text/javaScript">
	function validate() {
		var flag = false;
		if (document.login.password.value == "" || document.login.password.value == null) {
			document.getElementById("error_password").innerHTML = "*Please enter password.";
			flag = true;
		}
		else {
			document.getElementById("error_password").innerHTML = "";
		}
		if (document.login.email.value == "" || document.login.email.value == null) {
			document.getElementById("error_email").innerHTML = "*Please enter email address.";
			flag = true;
		} 
		else if (document.login.email.value != "") {
			var g = document.login.email.value;
			var at = g.indexOf("@");
			dot = g.lastIndexOf(".");
			if (at <=0 || dot <= 0 || dot <= at + 1 || dot == g.length - 1) {
				document.getElementById("error_email").innerHTML = "*invalid email address";
				flag = true;
			}
			else {
				document.getElementById("error_email").innerHTML = "";
			}
		}
		if (flag == true) {
			return false;
		} else {
			return true;
		}
	}
</script>
</head>

<body>
    <%
	String status = (String)session.getAttribute("status");
	String msg = (String)session.getAttribute("msg");
	if("loggedin".equals(status))
        {
		String role=(String)session.getAttribute("role");
		if("admin".equals(role))
		{
                	response.sendRedirect("adminHome.jsp");
            	}
		else if("staff".equals(role)){
                	response.sendRedirect("staffHome.jsp");
		}
	}
	else if("You are not logged in. Please login first.".equals(msg))
	{%>
        	<p style='color:red; margin-left: auto; margin-right: auto;text-align: center;'>
        	<% out.print(msg);
                msg=null;
                session.setAttribute("msg",null); %>
        	</p>
        <%}%>
            <h1 id="mainHeading">Login</h1>
            <br>
            <br>
            <div class="form">
                <form name="login" method="POST" action="ControllerServlet" onsubmit="return validate()">
                    <label class="form-label">Email:</label>
                    <input type="text" class="form-control" name="email"></input>
                    <span id="error_email" style="color:red"></span>
	<%if("No account found.".equals(status)){%>
		<script language="JavaScript" type="text/javaScript">
                document.getElementById("error_email").innerHTML = "*incorrect email";
                </script>
        <%}
	else{%>
                            <script language="JavaScript" type="text/javaScript">
                                document.getElementById("error_email").innerHTML = "";
                            </script>
        <%}%>
                                <br>
                                <br>
                                <label class="form-label">Password:</label>
                                <input type="password" class="form-control" name="password"></input>
                                <span id="error_password" style="color:red"></span>
       <%if("incorrrect password".equals(status)){%>
                                    <script language="JavaScript" type="text/javaScript">
                                        document.getElementById("error_password").innerHTML = "*incorrect password";
                                    </script>
        <%}
	else{%>
                                        <script language="JavaScript" type="text/javaScript">
                                            document.getElementById("error_password").innerHTML = "";
                                        </script>
        <%}%>
                                            <br>
                                            <br>
                                            <input type="submit" class="sub_button" name="action" value="Login"></input>
            </div>
</body>

</html>