package net.linxingyang.common.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 安全这边的工具类
 * 
 * @author linxingyang(linxingyang@foxmail.com)
 * @date 2017-11-1
 * @version 1.0
 */
public class SecurityUtils {
	/**
	 * MD5加密
	 * @param oldStr 要加密的字符串
	 * @return MD5 32位加密字符串
	 * @since 1.0
	 */
	public static String MD5(String oldStr){
		byte[] oldBytes = oldStr.getBytes();
		MessageDigest md;
		try{
			md = MessageDigest.getInstance("MD5");
			md.update(oldBytes);
			byte b[] = md.digest();
			
			int i;
			StringBuffer buffer = new StringBuffer("");
			for(int offset = 0; offset < b.length; offset++){
				i = b[offset];
				if(i < 0){
					i += 256;
				}
				if(i < 16){
					buffer.append("0");
				}
				buffer.append(Integer.toHexString(i));	
			}
			return buffer.toString();
		}
		catch (NoSuchAlgorithmException e) {
			return null;
		}
	}
}
