<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%
	//String str = "지금은 %ty년 %tm월 %td일 %tp %tA %tH시 %tm분 %ts초입니다."; //java.util.Formatter
	out.println(String.format("%tc", new Date()));
%>