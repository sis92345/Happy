<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.httpclient.HttpClient"%>
<%@ page import="org.apache.commons.httpclient.methods.GetMethod"%>
<%@ page import="org.apache.commons.httpclient.HttpStatus"%>
<%
	String url = null; 
	String news = request.getParameter("name");
	System.out.println(news);
	String type = request.getParameter("type");
	if(news.equals("동아일보")){
		url = "https://rss.donga.com/total.xml";
		if(type != null){
			switch(type){
				case "정치": url = "https://rss.donga.com/politics.xml"; break;
				case "사회": url = "https://rss.donga.com/national.xml"; break;
				case "경제": url = "https://rss.donga.com/economy.xml"; break;
			}
		}
	}	
	if(news.equals("한국일보")){
		url = "http://rss.hankooki.com/daily/dh_main.xml";
		if(type != null){
			switch(type){
				case "정치": url = "http://rss.hankooki.com/daily/dh_politics.xml"; break;
				case "사회": url = "http://rss.hankooki.com/daily/dh_society.xml"; break;
				case "경제": url = "http://rss.hankooki.com/daily/dh_economy.xml"; break;
			}
		}
	}
	if(news.equals("경향신문")){
		url = "http://www.khan.co.kr/rss/rssdata/total_news.xml";
		if(type != null){
			switch(type){
				case "정치": url = "http://www.khan.co.kr/rss/rssdata/politic_news.xml"; break;
				case "사회": url = "http://www.khan.co.kr/rss/rssdata/society_news.xml"; break;
				case "경제": url = "http://www.khan.co.kr/rss/rssdata/economy_news.xml"; break;
			}
		}
	}
	if(news.equals("한겨레신문")){
		System.out.println(news);
		url = "http://www.hani.co.kr/rss/";
		if(type != null){
			switch(type){
				case "정치": url = "http://www.hani.co.kr/rss/politics/"; break;
				case "사회": url = "http://www.hani.co.kr/rss/society/"; break;
				case "경제": url = "http://www.hani.co.kr/rss/economy/"; break;
			}
		}
	}
	
	
	HttpClient client = new HttpClient();
	GetMethod method = new GetMethod(url);
try {
	int statusCode = client.executeMethod(method);
	out.clearBuffer();
	response.reset();
	response.setContentType("text/xml; charset=utf-8");
	response.setStatus(statusCode);
	if (statusCode == HttpStatus.SC_OK) {
		String result = method.getResponseBodyAsString();
		response.setContentType("text/xml; charset=utf-8");
		out.println(new String(result.getBytes("ISO8859_1"), "utf-8"));
	}
} finally {
	if (method != null)
		method.releaseConnection();
}
%>