package MyPackage;
import MyPackage.*;
import java.util.*;
import java.io.*;
public class bookBean implements Serializable {
private String bname;
private String aname;
private int quantity;
public bookBean(){
	bname=null;
	aname=null;
	quantity=0;
}
public bookBean(String bn,String an, int q) {
	bname = bn;
	aname = an;
	quantity=q;
}
public String getBname(){
	return bname;	
}
public String getAname(){
	return aname;
}
public int getQuantity(){
	return quantity;
}
public void setBname(String bn){
	bname=bn;
}
public void setAname(String an){
	aname=an;
}

public void setQuantity(int q){
	quantity=q;
}
public String toString( ){ 
	return "Book: " + bname + " ,Author: " + aname + ", copies= " + quantity;
}
}
