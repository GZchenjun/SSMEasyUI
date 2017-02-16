package com.cj.common.bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



public class WebUtil {
	
	public static final int PAGE_NO = 1;
	public static final int PAGE_SIZE = 20;


	public static int getPageNo(HttpServletRequest req) {
		String pageNoStr = req.getParameter("page");
		if (pageNoStr != null && !pageNoStr.equals("")) {
			return Integer.valueOf(pageNoStr);
		}
		return PAGE_NO;
	}


	public static int getPageSize(HttpServletRequest req) {
		String pageSizeStr = req.getParameter("rows");
		if (pageSizeStr != null && !pageSizeStr.equals("")) {
			return Integer.valueOf(pageSizeStr);
		}
		return PAGE_SIZE;
	}

	
}
