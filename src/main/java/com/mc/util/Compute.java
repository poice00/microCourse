package com.mc.util;

import java.util.Date;

public class Compute {
	
	/**
	 * @desc 计算时间差，表示成X天，X小时前。。。
	 * @param date 发布时间
	 * @return String 
	 * @author yanbaobin@yeah.net
	 * @date Sep 24, 2015 10:29:31 AM
	 */
	public static String timeDiff(Date date){
		
//		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		long diff = new Date().getTime() - date.getTime();
		
		long years = diff / (60 * 60 * 24 * 30 * 365 * 1000);
		diff %= (60 * 60 * 24 * 30 * 365 * 1000);
		long months = diff / (60 * 60 * 24 * 30 * 1000);
		diff %= (60 * 60 * 24 * 30 * 1000);
		long days = diff / (60 * 60 * 24 * 1000);
		diff %= (60 * 60 * 24 * 1000);
		long hours = diff / (60 * 60 * 1000);
		diff %= (60 * 60 * 1000);
		long minutes = diff / (60 * 1000);
		diff %= (60 * 1000);
		long seconds = diff / 1000;
		
		String elapse;
		if(0 != years)
			elapse = years + "年";
		else if(0 != months)
			elapse = months + "个月";
		else if(0 != days)
			elapse = days + "天";
		else if(0 != hours)
			elapse = hours + "小时";
		else if(0 != minutes)
			elapse = minutes + "分钟";
		else
			elapse = seconds + "秒";
		
		return elapse;
	}
	
	/**
	 * @desc 从头像路径里获取登录名，主要是按json格式保存的时候
	 * 		 转义字符会干扰
	 * @param avatarPath 头像路径
	 * @return string，表示登录名
	 * @author yanbaobin@yeah.net
	 * @date Sep 27, 2015 2:59:04 PM
	 */
	public static String getLoignNameFromAvatarPath(String avatarPath){
		String avatar = avatarPath;
		
		if(avatar == null)
			avatar = "default";
		else{
			int index1 = avatar.indexOf("upload");								
			int index2 = avatar.lastIndexOf('.');
			avatar = avatar.substring(index1 + 7, index2 - 7);		//upload/XXX/avatar.jpg,正好加7，减7
		}
		
		return avatar;
	}
}
