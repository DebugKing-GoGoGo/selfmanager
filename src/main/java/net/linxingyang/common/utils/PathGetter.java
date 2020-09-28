package net.linxingyang.common.utils;

import java.net.URLDecoder;


public class PathGetter {

	public static String classRootPath() {
		return URLDecoder.decode(PathGetter.class.getClassLoader().getResource("").getPath().toString());
	}
	
	public static String eclipseWebProjectRootPath() {
		// C:/linxingyangWorkspace/websale/websale/src/main/webapp/WEB-INF/classes/
		String p = classRootPath();
		int i = p.lastIndexOf("WEB-INF/classes");
		return p.substring(0, i);
	}

}
