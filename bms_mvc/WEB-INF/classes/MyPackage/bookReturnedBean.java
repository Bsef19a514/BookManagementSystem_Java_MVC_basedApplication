package MyPackage;
import MyPackage.*;
import java.util.*;
import java.io.*;
public class bookReturnedBean implements Serializable {
private String fname;
private String lname;
private String bname;
private String aname;
private String cnic;
private String idate;
private String ddate;
private String rdate;
private int fine;
public bookReturnedBean(){
	fname=null;
	lname=null;
	cnic=null;
	bname=null;
	aname=null;
	idate=null;
	rdate=null;
	ddate=null;
	fine=0;
}
public bookReturnedBean(String fn,String ln,String c, String bn,String an,String id,String dd,int f, String rd) {
	fname = fn;
	lname = ln;
	cnic=c;
	bname=bn;
	aname=an;
	idate=id;
	rdate=rd;
	ddate=dd;
	fine=f;
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
public String getIdate(){
	return idate;
}
public String getRdate(){
	return rdate;
}
public String getDdate(){
	return ddate;
}
public int getFine(){
	return fine;
}
public void setFname(String fn){
	fname=fn;
}
public void setLname(String ln){
	lname=ln;
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
public void setDdate(String dd){
	ddate=dd;
}
public void setRdate(int f){
	fine=f;
}
public String toString(){
	return "Name= "+fname+" "+lname+", Cnic= "+cnic+", Book= "+bname+", Author= "+aname+", Issue Date= "+idate+",Due Date= "+ddate+", Return Date= "+rdate+", Fine= "+fine;
}
}
