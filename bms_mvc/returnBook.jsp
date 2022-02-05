<html>

<head>
	<title>return Book</title>


	

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

	<link rel="stylesheet" href="styles.css">


	<script language="JavaScript" type="text/javaScript">

function validateReturn(){
	var flag=false;
	if(document.rBook.cnic.value==""||document.rBook.cnic.value==null){
		document.getElementById("error_cnic").innerHTML="*Please enter CNIC";
		flag=true;
	}
	else{
		document.getElementById("error_cnic").innerHTML="";
	}
	if(document.rBook.cnic.value.length!=13){
		document.getElementById("error_cnic").innerHTML="*CNIC must be 13 character long";
		flag=true;
	}
	else{
		document.getElementById("error_cnic").innerHTML="";
	}
	if(document.rBook.bname.value==""||document.rBook.bname.value==null){
		document.getElementById("error_bname").innerHTML="*Please enter book name.";
		flag=true;
	}
	else{
		document.getElementById("error_bname").innerHTML="";
	}
	if(document.rBook.aname.value==""||document.rBook.aname.value==null){
		document.getElementById("error_aname").innerHTML="*Please enter author name";
		flag=true;
	}
	else{
		document.getElementById("error_aname").innerHTML="";
	}
	if(document.rBook.rdate.value==""||document.rBook.rdate.value==null){
		document.getElementById("error_rdate").innerHTML="*Please enter return date of the book.";
		flag=true;	
	}
	else{
		document.getElementById("error_rdate").innerHTML="";
	}
	if( flag==true){
		return false;
	}
	else{
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
		document.rBook.rdate.value=cyear+"-"+cmonth+"-"+cdate;
		//alert(document.rBook.rdate.value);
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
			<form name="rBook" method="POST" action="ControllerServlet" onsubmit="return validateReturn()">
			<h1 class="H1" id="mainHeading">Return Book</h1>
			<table class="issue" id=" issue">
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
					<td><label class="form-label">CNIC:</label></td>
					<td><input type="text" class="form-control" name="cnic" placeholder="xxxxxxxxxxxxxxx" onKeyPress="return number(event)"></input></td>
					<td><label class="form-label">Return Date:</label></td>
					<td><input type="date" class="form-control" name="rdate"></input><td>
				</tr>
				<tr>
					<td></td>
					<td><span id="error_cnic" style="color:red"></span></td>
					<td></td>
					<td><span id="error_rdate" style="color:red"></span></td>
				</tr>
			</table>
			<input type="submit" class="issue_button" name="action" value="Return"></input>
		</form>
	</div>
<%}
	else{
	    session.setAttribute("msg","You are not logged in. Please login first.");
            response.sendRedirect("login.jsp");
    
    }%>
</body>

</html>