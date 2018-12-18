package kr.co.mypet.util;

public class StringUtil {

	public static String getFileNameFormHeader(String contentDisposition){

		String fileName =" ";

		String[] split = contentDisposition.split(";");

		for(String str : split){
			if(str.indexOf("filename=") >= 0){
				//str.lastIndexOf("\"") -> 20글자 나옴 
				fileName = str.substring(11,str.lastIndexOf("\""));
			}
		}
		return fileName;
	}
	
	// 파일명으로 잘라주기 메서드
	public static String getFileExt(String fileName) {

	      int index = fileName.lastIndexOf(".");

	      if (index != -1) {
	         String ext = fileName.substring(index);
	         return ext;
	      } else {
	         return "";
	      }
	   }
	
	

}
