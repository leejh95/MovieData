package com.test.util;

import java.io.File;

public class FileRenameUtil {
	
	public static String CheckFileName(String path, String fname) {
		int period = fname.lastIndexOf(".");

		String name = fname.substring(0, period);
		String suffix = fname.substring(period);
		
		String savePath = path + System.getProperty("file.separator") + fname;
		
		File f = new File(savePath);
		
		int idx = 1;
		while(f.exists()) {
			StringBuffer sb = new StringBuffer();
			sb.append(name);
			sb.append(idx++);
			sb.append(suffix);
			
			fname = sb.toString();
			savePath = path + System.getProperty("file.separator") + fname;
			f = new File(savePath);
		}
		
		return fname;
	}
	
}
