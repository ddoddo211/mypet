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

}
