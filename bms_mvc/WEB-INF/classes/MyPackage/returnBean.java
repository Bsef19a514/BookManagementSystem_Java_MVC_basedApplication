package MyPackage;
import MyPackage.*;
import java.util.*;
import java.io.*;
public class returnBean implements Serializable {
private String bname;
private String aname;
private String cnic;
private String rdate;
public returnBean(){
	cnic=null;
	bname=null;
	aname=null;
	rdate=null;
}
public returnBean(String c, String bn,String an,String rd) {
	cnic=c;
	bname=bn;
	aname=an;
	rdate=rd;
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
public String getRdate(){
	return rdate;
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
public void setRdate(String rd){
	rdate=rd;
}
}
