package MyPackage;
import MyPackage.*;
import java.util.*;
import java.io.*;
public class issueBean implements Serializable {
private String fname;
private String lname;
private String bname;
private String aname;
private String email;
private String cnic;
private String idate;
private String rdate;
public issueBean(){
	fname=null;
	lname=null;
	email=null;
	cnic=null;
	bname=null;
	aname=null;
	idate=null;
	rdate=null;
}
public issueBean(String fn,String ln, String e, String c, String bn,String an,String id, String rd) {
	fname = fn;
	lname = ln;
	email=e;
	cnic=c;
	bname=bn;
	aname=an;
	idate=id;
	rdate=rd;
}
public String getFname(){
	return fname;
}
public String getLname(){
	return lname;
}
public String getBname(){
	return bname;
}
public String getAname(){
	return aname;
}
public String getCnic(){
	return cnic;
}
public String getEmail(){
	return email;
}
public String getIdate(){
	return idate;
}
public String getRdate(){
	return rdate;
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
public void setCnic(String c){
	cnic=c;
}
public void setBname(String bn){
	bname=bn;
}
public void setAname(String an){
	aname=an;
}
public void setIdate(String id){
	idate=id;
}
public void setRdate(String rd){
	rdate=rd;
}
public String toString(){
	return "Name= "+fname+" "+lname+",	Email= "+email+",	Book= "+bname+",	Author= "+aname+",	Issue Date= "+idate+",	Return Date= "+rdate;
}
}
