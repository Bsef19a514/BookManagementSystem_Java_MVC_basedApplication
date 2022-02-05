<%@page %>
<%
	if(session!=null){
		session.invalidate();
		response.sendRedirect("login.jsp");
	}
	else{
		response.sendRedirect("login.jsp");
	}
%>
	