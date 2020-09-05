package com.loits.training.repo;
import java.util.*;

enum AlSubStream{maths,Bio,Arts,Commerce}
enum UniversitySubjectStream {ComputerScience,InformationTechnology,BusinessStudies,Bioinformatics}

class Student {

String studentName;
String nicNo;
String currentAddress;
String permanentAddress;
Date  DOB;
char gender;
String alSubjectStream;
String stremRegister;
float zScore;


public void setStudentName(String studentName){
          this.studentName= studentName;
      }

public void setNicNo(String nicNo){  
  this.nicNo = nicNo;
      }

public void setCurrentAddress(String currentAddress){
  this.currentAddress = currentAddress;
      }

public void setPermanentAddress(String permanentAddress){
  this.permanentAddress = permanentAddress;
       }
public void setDOB(Date DOB){
  this.DOB = DOB;
       }

public void setGender(char gender){
  this.gender = gender;
       }
public void setAlSubjectStream(String alSubjectStream){
  this.alSubjectStream = alSubjectStream;
       }

public void setStremRegister(String stremRegister){
   this.stremRegister =stremRegister;
       }

public void setzScore(float zScore){
  this.zScore = zScore;
      }

public String getStudentName(){

 return this.studentName;
  }

public String getStremRegister(){
  return this.stremRegister;
}

public String getPermanentAddress(){
  return this.permanentAddress;
       }

public char getGender(){
 return this.gender;
       }

public float getzScore(){
  return this.zScore;

       }

public String getAlSubjectStream(){
  return this.alSubjectStream;
       }
}

class StreamSelectException extends RuntimeException {

	String msg;

	StreamSelectException(String msgs) {
		msg = msgs;
	}

	public String getMsg() {
		return this.msg;
	}
}


class subject {

String subjectCode;
String subjectName;
String status;
double periodInMonths;


}


public class StudentRegistration {

public static void main(String args[]){

 Student student = new Student();
Scanner s = new Scanner(System.in);
System.out.println("Please enter Student Name: ");
student.setStudentName(s.nextLine());

 System.out.println("Student Name: "+student.getStudentName());
System.out.println("Please enter Student Nic No: ");
student.setNicNo(s.nextLine());

System.out.println("Please enter Student Current Add: ");
student.setCurrentAddress(s.nextLine());

System.out.println("Please enter Student permanent Address: ");
student.setPermanentAddress(s.nextLine());

System.out.println("Please enter Zscore: ");
student.setzScore(s.nextFloat());

System.out.println("Please enter A/L subject stream: ");
student.setAlSubjectStream(s.nextLine());

/*System.out.println("Please enter Gender: ");
student.setGender(s.nextLine()); */
student.setGender('M');
student.setAlSubjectStream("maths");
student.setStremRegister("ComputerScience"); 

StudentRegistration studentReg = new StudentRegistration(); 
List<Student> studentList = new  ArrayList<Student>();   // create list to keep student objects
 
boolean selectStatus = studentReg.selectSub(student);

System.out.println("Subject selected: "+ selectStatus);
if(selectStatus){
  studentList.add(student);    // add the student to the list if validation process success
}

  for (Student objStudent : studentList) {
		    	 System.out.println("Student Name :"+objStudent.getStudentName());
		    	 System.out.println("Student University Subject Stream :"+objStudent.getStremRegister());
				
			}		      
 

}

public  boolean selectSub(Student studentReg){

if((studentReg.getAlSubjectStream() == AlSubStream.maths.toString() || studentReg.getAlSubjectStream() == 

AlSubStream.Bio.toString()) && studentReg.getzScore() > 1 && studentReg.getStremRegister() == 

UniversitySubjectStream.ComputerScience.toString() ){
 
 return true;
   } else if((studentReg.getAlSubjectStream() == AlSubStream.maths.toString() || studentReg.getAlSubjectStream() == 

AlSubStream.Bio.toString())  && studentReg.getStremRegister() == UniversitySubjectStream.Bioinformatics.toString() ){
  return true;
   } else if((studentReg.getAlSubjectStream() == AlSubStream.Arts.toString() || studentReg.getAlSubjectStream() == 

AlSubStream.Commerce.toString())  && studentReg.getStremRegister() == UniversitySubjectStream.BusinessStudies.toString() 

){
  return true;
   } else if(studentReg.getStremRegister() == UniversitySubjectStream.BusinessStudies.toString() && 

studentReg.getAlSubjectStream() != null ){
 return true;
}

else{
 return false;
    } 

}



}


