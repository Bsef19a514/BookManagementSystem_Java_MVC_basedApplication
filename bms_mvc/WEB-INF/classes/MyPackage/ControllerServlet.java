package MyPackage;

import java.io.*;
import java.sql.*;
import java.util.*; 
import javax.servlet.*;
import javax.servlet.http.*; 
public class ControllerServlet extends HttpServlet { 

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
{ 
	processRequest(request, response); 
} 


protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
{ 
	processRequest(request, response); 
} 

protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
{
	String userAction = request.getParameter("action"); 
if (userAction.equals("Login") )
{ 
	login(request,response);
}

else if (userAction.equals("Add Account"))
{ 
	addNewAccount(request,response); 
}
else if (userAction.equals("Add Book"))
{ 
	addNewBook(request,response);
}
else if (userAction.equals("Issue")) 
{  
	issueBook(request,response);
}
else if (userAction.equals("Return")) 
{  
	returnBook(request,response);
} 
else if (userAction.equals("Search")) 
{  
	searchBook(request,response);
   } 
}


private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{ 
	
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	loginBean lb=new loginBean(email,password);
	DAO dao=new DAO();
	userBean ub=dao.searchUser(lb);
	HttpSession session=request.getSession();
	session.setAttribute("msg",null);
	if(ub!=null){
		String pswd=ub.getPassword();
		if(pswd.equals("incorrect password")){
			session.setAttribute("status","incorrrect password");
			response.sendRedirect("login.jsp");
		}
		else{
			session.setAttribute("role",ub.getRole());
			session.setAttribute("fname",ub.getFname());
			session.setAttribute("lname",ub.getLname());
			session.setAttribute("status","loggedin");
			response.sendRedirect("login.jsp");
		} 
	}
	else{
		session.setAttribute("status","No account found.");
		response.sendRedirect("login.jsp");
	}
}
private void addNewAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{
	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	String role=request.getParameter("role");
	userBean ub=new userBean(fname,lname,email,password,role);
	DAO dao=new DAO();
	String msg=dao.addUser(ub);
	HttpSession session=request.getSession(false);
	if(msg.equals("Account created successfully.")){
		session.setAttribute("msg",msg);
		response.sendRedirect("adminHome.jsp");
	}
	else{
		session.setAttribute("msg",msg);
		response.sendRedirect("addNewAccount.jsp");
	}
}
private void addNewBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{	
	String bname=request.getParameter("bname");
	String aname=request.getParameter("aname");
	String Quantity=request.getParameter("quantity");
	int quantity=Integer.parseInt(Quantity);
	bookBean bb=new bookBean(bname,aname,quantity);
	DAO dao=new DAO();
	String msg=dao.addBook(bb);
	HttpSession session=request.getSession(false);
	if(msg.equals("Book added to the DataBase Successfully.")){
		session.setAttribute("msg",msg);
		response.sendRedirect("adminHome.jsp");
	}
	else{
			session.setAttribute("msg",msg);
			response.sendRedirect("addNewBook.jsp");
	} 
}
private void issueBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{
	String bname=request.getParameter("bname");
	String aname=request.getParameter("aname");
	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
	String email=request.getParameter("email");
	String cnic=request.getParameter("cnic");
	String idate=request.getParameter("idate");
	String rdate=request.getParameter("rdate");
	issueBean ib=new issueBean(fname,lname,email,cnic,bname,aname,idate,rdate);
	DAO dao=new DAO();
	String result=dao.issueBook(ib);
	HttpSession session=request.getSession(false);
	session.setAttribute("msg",result);
	response.sendRedirect("issueBook.jsp");
}
private void returnBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{
	String bname=request.getParameter("bname");
	String aname=request.getParameter("aname");
	String cnic=request.getParameter("cnic");
	String rdate=request.getParameter("rdate");
	returnBean rb=new returnBean(cnic, bname,aname,rdate);
	DAO dao=new DAO();
	HttpSession session=request.getSession(false);
	bookReturnedBean brb=dao.returnBook(rb);
    	if(brb!=null){
        	session.setAttribute("result",brb);
		response.sendRedirect("bookReturned.jsp");
	}
	else{
        	session.setAttribute("msg","Incorrect information. Please check Book Name, Author Name and CNIC.");
	   	response.sendRedirect("returnBook.jsp");
	}
}
private void searchBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{
	String name=request.getParameter("sbook");
	DAO dao=new DAO();
	HttpSession session=request.getSession(false);
	ArrayList<searchBean> sb=dao.searchBook(name);
	if(sb!=null){
		session.setAttribute("result",sb);
		response.sendRedirect("showBooks.jsp");
	}
	else{
		session.setAttribute("msg","No book found");
		if(session.getAttribute("role").equals("admin"))
		{
			response.sendRedirect("adminHome.jsp");
		}
		else{
			response.sendRedirect("staffHome.jsp");
		}
	}	
}
}