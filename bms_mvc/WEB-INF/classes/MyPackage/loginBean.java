package MyPackage;
import MyPackage.*;
import java.util.*;
import java.io.*;
public class loginBean implements Serializable{
private String email;
private String password;
public loginBean(){
	password=null;
	email=null;
}
public loginBean(String e, String pswd) {
	email=e;
	password=pswd;
}
public String getEmail(){
	return email;	
}
public String getPassword(){
	return password;	
}
public void setEmail(String e){
	email=e;	
}
public void setPassword(String p){
	password=p;	
}
public String toString( ){ 
return "Email= "+email+" Password= "+password;
}
}
