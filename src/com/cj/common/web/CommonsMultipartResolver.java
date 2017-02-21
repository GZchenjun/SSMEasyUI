package com.cj.common.web;

import javax.servlet.http.HttpServletRequest;

public class CommonsMultipartResolver extends org.springframework.web.multipart.commons.CommonsMultipartResolver{

	@Override
	public boolean isMultipart(HttpServletRequest request) {
		String uri = request.getRequestURI();
		if (uri.indexOf("ueditor/core") > 0) {
			System.out.println("使用UEditor的过滤器");
			return false; // 请使用UEditor的判断方式 
		} else {
			System.out.println("使用默认过滤器");
			return super.isMultipart(request); // springmvc的
		}
	}

}
