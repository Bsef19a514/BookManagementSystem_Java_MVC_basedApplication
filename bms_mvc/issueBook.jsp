<html>

<head>
    <title>Add new Account</title>
    <link rel="stylesheet" href="styles.css">
    <script language="JavaScript" type="text/javaScript">
        function validateIssue()
        {
            //alert("ok");
            var flag=false;
            if(document.issueBook.fname.value==""||document.issueBook.fname.value==null)
            {
                document.getElementById("error_fname").innerHTML="*Please enter First name.";
                flag=true;
            }
            else{
                document.getElementById("error_fname").innerHTML="";
            }
            if(document.issueBook.lname.value==""||document.issueBook.lname.value==null)
            {
                document.getElementById("error_lname").innerHTML="*Please enter Last name.";
                flag=true;
            }
            else
            {
                document.getElementById("error_lname").innerHTML="";
            }
            if(document.issueBook.bname.value==""||document.issueBook.bname.value==null)
            {
                document.getElementById("error_bname").innerHTML="*Please enter book name.";
                flag=true;
            }
            else{
                document.getElementById("error_bname").innerHTML="";
            }
	    if(document.issueBook.email.value==""||document.issueBook.email.value==null)
            {
                document.getElementById("error_email").innerHTML="*Please enter email.";
                flag=true;
            }
            else{
                document.getElementById("error_email").innerHTML="";
            }
		if(document.issueBook.cnic.value==""||document.issueBook.cnic.value==null)
            {
                document.getElementById("error_cnic").innerHTML="*Please enter cnic.";
                flag=true;
            }
            else{
                document.getElementById("error_cnic").innerHTML="";
            }
	    if(document.issueBook.cnic.value.length!=13){
		document.getElementById("error_cnic").innerHTML="*CNIC must be 13 character long";
		flag=true;
		}
		else{
		document.getElementById("error_cnic").innerHTML="";
		}
            if(document.issueBook.aname.value==""||document.issueBook.aname.value==null)
            {
                document.getElementById("error_aname").innerHTML="*Please enter author name.";
                flag=true;
            }
            else{
                document.getElementById("error_aname").innerHTML="";
            }
            if(document.issueBook.idate.value==""||document.issueBook.idate.value==null)
            {
                document.getElementById("error_idate").innerHTML="*Please enter issue date.";
                flag=true;
            }
            else{
                document.getElementById("error_idate").innerHTML="";
            }
            if(document.issueBook.rdate.value==""||document.issueBook.rdate.value==null)
            {
                document.getElementById("error_rdate").innerHTML="*Please enter return date.";
                flag=true;
            }
            else{
                document.getElementById("error_rdate").innerHTML="";
            }
            if( flag==true)
            {
		        return false;
	        }
	        else
            {
		        return true;
	        }
        }
function number(event)
	{
		var keychar;
		keychar = event.key;
		if ((("0123456789").indexOf(keychar) > -1))
		   return true;
		else
		   return false;
	}
function setReturnDate()
	{
		var currentDate=new Date();
		var cdate=currentDate.getDate();
		var cmonth=currentDate.getMonth()+1;
		var cyear=currentDate.getFullYear();
		if(cdate<10){
			cdate="0"+cdate;
		}
		if(cmonth<10){
			cmonth="0"+cmonth;
		}
		document.issueBook.idate.value=cyear+"-"+cmonth+"-"+cdate;
		var returnDate=new Date(currentDate);
    		returnDate.setDate(returnDate.getDate()+5);
		var rdate=returnDate.getDate();
		var rmonth=returnDate.getMonth()+1;
		var ryear=returnDate.getFullYear();
		if(rdate<10){
			rdate="0"+rdate;		
		}
		if(rmonth<10){
			rmonth="0"+rmonth;
		}
		document.issueBook.rdate.value=ryear+"-"+rmonth+"-"+rdate;
	}
    </script>
</head>

<body onload="setReturnDate()">
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
				}%>
        		<div class="book_issue_div">
			<form name="issueBook" method="POST" action="ControllerServlet" onsubmit="return validateIssue()">
			<h1 class="H1" id="mainHeading">Issue Book</h1>
			<table class="issue" id=" issue">
				<tr>
					<td><label class="form-label">First Name:</label></td>
					<td><input type="text" class="form-control" name="fname" placeholder="First Name"></input></td>
					<td><label class="form-label">Last Name:</label></td>
					<td><input type="text" class="form-control" name="lname" placeholder="Last Name"></input></td>
				</tr>
				<tr>
					<td></td>
					<td><span id="error_fname" style="color:red"></span></td>
					<td></td>
					<td><span id="error_lname" style="color:red"></span></td>
				</tr>
				<tr>
					<td><label class="form-label">CNIC:</label></td>
					<td><input type="text" class="form-control" name="cnic" placeholder="xxxxxxxxxxxxxxx"
							onKeyPress="return number(event)"></input></td>
					<td><label class="form-label">Email:</label></td>
					<td><input type="text" class="form-control" name="email"></input>
					<td>
				</tr>
				<tr>
					<td></td>
					<td><span id="error_cnic" style="color:red"></span></td>
					<td></td>
					<td><span id="error_email" style="color:red"></span></td>
				</tr>
				<tr>
					<td><label class="form-label">Book Name:</label></td>
					<td><input type="text" class="form-control" name="bname"></input></td>
					<td><label class="form-label">Author Name:</label></td>
					<td><input type="text" class="form-control" name="aname"></input></td>
				</tr>
				<tr>
					<td></td>
					<td><span id="error_bname" style="color:red"></span></td>
					<td></td>
					<td><span id="error_aname" style="color:red"></span></td>
				</tr>
				<tr>
					<td><label class="form-label">Issue Date:</label></td>
					<td><input type="date" class="form-control" name="idate"></input></td>
					<td><label class="form-label">Return Date:</label></td>
					<td><input type="date" class="form-control" name="rdate"></input>
					<td>
				</tr>
				<tr>
					<td></td>
					<td><span id="error_idate" style="color:red"></span></td>
					<td></td>
					<td><span id="error_rdate" style="color:red"></span></td>
				</tr>
			</table>
			<input type="submit" class="issue_button" name="action" value="Issue"></input>
		</form>
	</div>
<%}
	else{
	    session.setAttribute("msg","You are not logged in. Please login first.");
            response.sendRedirect("login.jsp");
    
    }%>
</body>

</html>