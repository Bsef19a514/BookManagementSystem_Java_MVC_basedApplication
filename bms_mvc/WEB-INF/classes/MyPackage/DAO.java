package MyPackage;
import MyPackage.*;
import java.sql.*;
import java.util.*;
import java.text.SimpleDateFormat;  
import java.util.Date; 
import java.util.Locale;
import java.util.concurrent.TimeUnit;
import java.io.*;
public class DAO implements Serializable{

	String url=null;
	Connection con=null;
	public DAO(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
    			url = "jdbc:mysql://127.0.0.1/persons";
    			con=DriverManager.getConnection(url,"root","root");
		}
		catch(Exception e){
			System.out.println(e);
		}
	}

	public userBean searchUser(loginBean lb){
		userBean ub=null;
		String email=lb.getEmail();
		String pswd=lb.getPassword();
		try{
			PreparedStatement pst=con.prepareStatement("Select * from personrecords where email=? ");
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();          
			if(rs.next())
			{
				ub=new userBean();
				String dbPassword = rs.getString("password");
				String dbFname = rs.getString("firstName");
				String dbLname = rs.getString("lastName");
				String dbrole = rs.getString("role");
				if(dbPassword.equals(pswd))
				{
					ub.setFname(dbFname);
					ub.setLname(dbLname);
					ub.setEmail(email);
					ub.setPassword(pswd);
					ub.setRole(dbrole);
				}
				else{
					pswd="incorrect password";
					ub.setFname(dbFname);
					ub.setLname(dbLname);
					ub.setEmail(email);
					ub.setPassword(pswd);
					ub.setRole(dbrole);
				}
			}
			con.close();
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		return ub;
	}
	
	public String addUser(userBean ub){
		String msg="There is another account with this email.";
		try{	
			String email=ub.getEmail();
			String fname=ub.getFname();
			String lname=ub.getLname();
			String password=ub.getPassword();
			String role=ub.getRole();
   			PreparedStatement pst=con.prepareStatement("Select * from personRecords where email=? ");
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();          
			if(!rs.next())
			{
				Statement st=con.createStatement();
				String query="insert into personrecords(firstName,lastName,email,password,role) values('"+fname+"', '"+lname+"', '"+email+"', '"+password+"','"+role+"')";
				int resultSet = st.executeUpdate( query );
				if(resultSet > 0){
					msg="Account created successfully.";	
				}
			}
			con.close(); 		
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		return msg;
	}
	public String addBook(bookBean bb)
	{
		String msg="This book is already present in DataBase.";
		try{
			String bname=bb.getBname();
			String aname=bb.getAname();
			int tQuantity=bb.getQuantity();
			PreparedStatement pst=con.prepareStatement("Select * from bookrecords where bookName=? AND authorName=?");
			pst.setString(1, bname);
			pst.setString(2, aname);
			ResultSet rs = pst.executeQuery();          
			if(!rs.next())
			{
				Statement st=con.createStatement();
				String query="insert into bookrecords(bookName,authorName,totalQuantity,remainingQuantity) values('"+bname+"', '"+aname+"', "+tQuantity+", "+tQuantity+")";
				int resultSet = st.executeUpdate( query );
				if(resultSet > 0)
				{
					msg="Book added to the DataBase Successfully.";	
				}
			}
			con.close();
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		return msg;
	}
	public ArrayList<searchBean> searchBook(String name){
		ArrayList<searchBean> bAL=null;
		searchBean sb=null;
		try
		{		
   			PreparedStatement pst=con.prepareStatement("Select * from bookrecords where bookName=? OR authorName=?");
			pst.setString(1, name);
			pst.setString(2, name);
			ResultSet rs = pst.executeQuery();
			if(rs.next())
			{
				bAL=new ArrayList<searchBean>();
				rs.beforeFirst();    
				while(rs.next()){
					String dbBname = rs.getString("bookName");
					String dbAname = rs.getString("authorName");
					int dbTquantity= rs.getInt("totalQuantity");
					int dbRquantity=rs.getInt("remainingQuantity");
					sb=new searchBean(dbBname,dbAname,dbTquantity,dbRquantity);
					bAL.add(sb);
				}
			}
			con.close();
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		return bAL;
	}
	
	public String issueBook(issueBean ib)
	{
		String msg=null;
		try
		{
			String bname=ib.getBname();
			String aname=ib.getAname();
			String fname=ib.getFname();
			String lname=ib.getLname();
			String email=ib.getEmail();
			String Cnic=ib.getCnic();
			String idate=ib.getIdate();
			String rdate=ib.getRdate();
			Double cnic=Double.parseDouble(Cnic);
			fname=fname.toLowerCase();
			lname=lname.toLowerCase();
			bname=bname.toLowerCase();
			aname=aname.toLowerCase();
			PreparedStatement pst=con.prepareStatement("Select * from bookrecords where bookName=? AND authorName=?");
			pst.setString(1, bname);
			pst.setString(2, aname);
			ResultSet resultSet = pst.executeQuery();     
			if(resultSet.next())
			{
				int dbTquantity= resultSet.getInt("totalQuantity");
				int dbRquantity=resultSet.getInt("remainingQuantity");
				if(dbRquantity>=2)
				{
					pst=con.prepareStatement("Select * from book_issue_return_records where cnic=? AND status=?");
					pst.setDouble(1, cnic);
					pst.setInt(2, 0);
					ResultSet resultSet2 = pst.executeQuery();
					if(!resultSet2.next())
					{
						Statement st=con.createStatement();
						String query="insert into book_issue_return_records(firstName,lastName,bookName,authorName,email,cnic,issueDate,dueDate,status) values('"+fname+"', '"+lname+"', '"+bname+"', '"+aname+"','"+email+"',"+cnic+",'"+idate+"','"+rdate+"',"+0+")";
						int rs= st.executeUpdate(query);
						pst=con.prepareStatement("update bookrecords set remainingQuantity=? where bookName=? AND authorName=?");
						pst.setInt(1,dbRquantity-1 );
						pst.setString(2, bname);
						pst.setString(3, aname); 
						int rs2 = pst.executeUpdate();
						if(rs>0 && rs2>0)
						{
							msg="Book issued Successfully.";
						}
						else{
							msg="An error has occured while issuing book. please try again.";
						}
					}	
					else{
						msg="There is already another book issued on this cnic. Please return that one first.";
					}
				}
				else{
					msg="Sorry, all copies of this book are already issued. Please try later.";
				}	
			}
			else{
				msg="No such book found";
			}
			con.close();
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		return msg;
	}

	public bookReturnedBean returnBook(returnBean rb){
		//String msg=null;
		bookReturnedBean brb=null;
		try{
			String bname=rb.getBname();
			String aname=rb.getAname();
			String Cnic=rb.getCnic();
			String rdate=rb.getRdate();
			Double cnic=Double.parseDouble(Cnic);
			bname=bname.toLowerCase();
			aname=aname.toLowerCase();
			PreparedStatement pst=con.prepareStatement("Select * from book_issue_return_records where cnic=? AND status=? AND bookName=? AND authorName=?");
			pst.setDouble(1, cnic);
			pst.setInt(2, 0);
			pst.setString(3,bname);
			pst.setString(4,aname);
			ResultSet resultSet = pst.executeQuery();
			if(resultSet.next())
			{
				String dbDdate=resultSet.getString("dueDate");
				String dbFname=resultSet.getString("firstName");
				String dbLname=resultSet.getString("lastName");
				String dbIdate=resultSet.getString("issueDate");
				pst=con.prepareStatement("update bookrecords set remainingQuantity=remainingQuantity+1 where bookName=? AND authorName=?");
				pst.setString(1, bname);
				pst.setString(2, aname); 
				int rs = pst.executeUpdate();
				int fine=0;
				try{
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd", Locale.ENGLISH);
        				Date returnDate = sdf.parse(rdate);
        				Date dbDueDate = sdf.parse(dbDdate);
					//msg= rdate+"  "+dbDdate;
        				long diff = returnDate.getTime() - dbDueDate.getTime();
					TimeUnit time = TimeUnit.DAYS; 
        				long difference = time.convert(diff, TimeUnit.MILLISECONDS);
					if(difference<=0){
						fine=0;
					}
					else{
						fine=100*(int)difference;
					}
				}
				catch(Exception ex){
					System.out.println(ex);
				}
				pst=con.prepareStatement("update book_issue_return_records set status=? , returnedDate=? , fine=? where bookName=? AND authorName=? AND cnic=?");
				pst.setInt(1,1);
				pst.setString(2,rdate);
				pst.setInt(3, fine);
				pst.setString(4,bname);
				pst.setString(5,aname);
				pst.setDouble(6,cnic);
				int rs2 = pst.executeUpdate();
				if(rs>0 && rs2>0)
				{
					brb=new bookReturnedBean(dbFname,dbLname,Cnic,bname,aname,dbIdate,dbDdate,fine,rdate);
					//msg=brb.toString();
				}
				else{
						return brb;
					//msg="There was an error during returning book. Please try again.";
				}
			} 
			else{
					//msg="Error: Incorrect information. Check cnic, book name or author name.";
						return brb;
			}
			con.close();
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		return brb;
	}	
}	
