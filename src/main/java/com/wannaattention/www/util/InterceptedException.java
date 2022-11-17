package com.wannaattention.www.util;

public class InterceptedException extends RuntimeException {
	private String url;
	public InterceptedException(String msg, String url) {
		super(msg);
		this.url = url;
	}
	public String getUrl() {
		return url;
	}
}