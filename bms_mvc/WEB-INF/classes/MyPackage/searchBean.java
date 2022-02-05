package MyPackage;
import MyPackage.*;
import java.util.*;
import java.io.*;
public class searchBean implements Serializable {
private String bname;
private String aname;
private int tQuantity;
private int rQuantity;
public searchBean(){
	bname=null;
	aname=null;
	tQuantity=0;
	rQuantity=0;
}
public searchBean(String bn,String an, int t, int r) {
	bname = bn;
	aname = an;
	tQuantity=t;
	rQuantity=r;
}
public String getBname(){
	return bname;	
}
public String getAname(){
	return aname;
}
public int getTQuantity(){
	return tQuantity;
}
public int getRQuantity(){
	return rQuantity;
}
public void setBname(String bn){
	bname=bn;
}
public void setAname(String an){
	aname=an;
}
public void setTQuantity(int t){
	tQuantity=t;
}
public void setRQuantity(int r){
	rQuantity=r;
}
public String toString( ){ 
	return "Book: " + bname + " Author: " + aname + ", Total copies= " + tQuantity+ ", Remaining copies= " + rQuantity;
}
}
