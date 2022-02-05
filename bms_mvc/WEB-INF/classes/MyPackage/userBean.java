package MyPackage;
import MyPackage.*;
import java.util.*;
import java.io.*;
public class userBean implements Serializable {
private String fname;
private String lname;
private String email;
private String password;
private String role;

public userBean(String pswd) {
	password=pswd;
}
public userBean(){
	fname=null;
	lname=null;
	email=null;
	password=null;
	role=null;	
}
public userBean(String fn,String ln, String e, String pswd, String r) {
	fname = fn;
	lname = ln;
	email=e;
	password=pswd;
	role=r;
}
public String getRole(){
	return role;	
}
public String getEmail(){
	return email;
}
public String getPassword(){
	return password;
}
public String getFname(){
	return fname;
}
public String getLname(){
	return lname;
}
public void setFname(String fn){
	fname=fn;
}
public void setLname(String ln){
	lname=ln;
}
public void setEmail(String e){
	email=e;
}
public void setPassword(String p){
	password=p;
}
public void setRole(String r){
	role=r;
}
public String toString( ){ 
return "Welcome  " + fname + " " + lname + ",  role= " + role;
}
}
