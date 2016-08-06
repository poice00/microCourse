package com.mc.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

public class VideoDataGet {
	
	   
	public static String getHtmlResource(String url, String encoding) {
		StringBuffer buffer=new StringBuffer();
		URL urlObj=null;
		URLConnection uc=null;
		InputStreamReader in=null;
		BufferedReader reader=null;
		try{
			urlObj=new URL(url);
			uc=urlObj.openConnection();
			in=new InputStreamReader(uc.getInputStream(),encoding);
			reader=new BufferedReader(in);
			String temp=null;
			while((temp=reader.readLine())!=null){
				buffer.append(temp+"\n");
			}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("网络连接失败");
		}finally{
			if(in!=null){
				try {
					in.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return buffer.toString();
	}
	
	public static void main(String[] args) throws Exception {
		String imgsrc="http://v1.mukewang.com/778df758-7194-46a6-b361-3d10aafdcd02/L.mp4";
		URL imgUrl = new URL(imgsrc);
		InputStream in = imgUrl.openStream();
		imgsrc="778df758-7194-46a6-b361-3d10aafdcd02L.mp4";
		System.out.println(imgsrc);
		FileOutputStream fo = new FileOutputStream(new File("src//main//webapp//resources//images//course//"+imgsrc));  
        byte[] buf = new byte[1024]; 
        int length = 0;  
        while ((length = in.read(buf, 0, buf.length)) != -1) {  
            fo.write(buf, 0, length);  
        }  
        in.close();  
        fo.close(); 
	}
}
