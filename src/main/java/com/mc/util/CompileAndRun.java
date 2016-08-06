package com.mc.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import javax.servlet.http.HttpServlet;

import org.apache.commons.fileupload.util.LimitedInputStream;
import org.junit.Test;

//import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class CompileAndRun extends HttpServlet{
	private static Process process ;//执行子进程

	  /**
	   * 编译并且运行JAVA代码
	   * @author Maple
	   */
	public void javaRun(String code) throws Exception{
		String className = null; //类名
	    String classStr = null;
	    BufferedWriter bw = null;
		classStr = code.substring(code.indexOf("public class"),code.indexOf("{")).toString();//获取类名字符串
		String[] classStrArray = classStr.split("\\s{1,}");//按空格分开
		className = classStrArray[2];
		File sourceFile = new File(className+".java");//保存源代码
        if(sourceFile.exists()){
          sourceFile.delete();
        }
        FileWriter fr = new FileWriter(sourceFile);
        bw = new BufferedWriter(fr);
        fr.write(code);
        bw.close();
        fr.close();  

        Runtime rt = Runtime.getRuntime(); 
        Process proc = rt.exec("javac "+className+".java \n"); 
        /*InputStream stderr = proc.getErrorStream(); */
        InputStream stderr=proc.getErrorStream();
        InputStreamReader isr = new InputStreamReader(stderr); 
        BufferedReader br1 = new BufferedReader(isr); 
        String line = null; 
        System.out.println(""); 
        while ( (line = br1.readLine()) != null)
        {
        	line = new String(line.getBytes("GBK"), "UTF-8");
        }
        int exitVal = proc.waitFor(); 
        System.out.println("Process exitValue: " + exitVal); 
	}
	
	public String codeAndRun(String str,String path) throws Exception {
		String className = null; //类名
	    String classStr = null;
	    BufferedWriter bw = null;
	    String line = ""; 
		classStr = str.substring(str.indexOf("public class"),str.indexOf("{")).toString();//获取类名字符串
		String[] classStrArray = classStr.split("\\s{1,}");//按空格分开
		 if(classStrArray.length!=3){
			 line="编译失败：格式不符合规范，请检查类名是否正确(如：public class YouClassName{})";
	      return line;
		 }
		className = classStrArray[2];
		File sourceFile = new File(className+".java");//保存源代码
        if(sourceFile.exists()){
          sourceFile.delete();
        }
        FileWriter fr = new FileWriter(sourceFile);
        bw = new BufferedWriter(fr);
        fr.write(str);
        bw.close();
        fr.close();  
        Runtime rt = Runtime.getRuntime();
        Process proc = rt.exec("cmd");
        proc = rt.exec("javac "+className+".java");
        InputStream stderr=proc.getErrorStream();
        InputStreamReader isr2 = new InputStreamReader(stderr,"GBK"); 
       
        BufferedReader br2 = new BufferedReader(isr2);
        String result=br2.readLine();
        if (result==null) {
        	proc = rt.exec("java "+className);
        	InputStream stde=proc.getInputStream();
        	InputStreamReader isr1=new InputStreamReader(stde,"GBK");
        	BufferedReader br1= new BufferedReader(isr1);
        	 while ( (result = br1.readLine()) != null)
             {
        		String line1=result+"\n";
 				line=line+line1;	
             }	
		}else{
			while ((result=br2.readLine())!=null) {
				String line1=result+"\n";
				line=line+line1;	
			}	 
		}
        sourceFile = new File(path+"/"+"result.html");//保存源代码
        if(sourceFile.exists()){
          sourceFile.delete();
        }
        fr = new FileWriter(sourceFile);
        bw = new BufferedWriter(fr);
        fr.write("<h2>"+line+"</h2>");
        bw.close();
        fr.close(); 
        return line;
	}
	public int codeAndRunRes(String str) throws Exception {
		String className = null; //类名
	    String classStr = null;
	    BufferedWriter bw = null;
	    String line = ""; 
		classStr = str.substring(str.indexOf("public class"),str.indexOf("{")).toString();//获取类名字符串
		String[] classStrArray = classStr.split("\\s{1,}");//按空格分开
		 if(classStrArray.length!=3){
	      return 0;
		 }
		className = classStrArray[2];
		File sourceFile = new File(className+".java");//保存源代码
        if(sourceFile.exists()){
          sourceFile.delete();
        }
        FileWriter fr = new FileWriter(sourceFile);
        bw = new BufferedWriter(fr);
        fr.write(str);
        bw.close();
        fr.close();  
        Runtime rt = Runtime.getRuntime();
        Process proc = rt.exec("cmd");
        proc = rt.exec("javac "+className+".java");
        InputStream stderr=proc.getErrorStream();
        InputStreamReader isr2 = new InputStreamReader(stderr,"GBK"); 
        BufferedReader br2 = new BufferedReader(isr2);
        String result=br2.readLine();
        if (result==null) {
        	return 1; 	
		}else{
			return 0; 
		}
	}
}
