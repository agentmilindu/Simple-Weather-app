<%@page import="NET.webserviceX.www.GlobalWeatherSoapProxy"%>
<%@page import="NET.webserviceX.www.GlobalWeatherLocator"%>
<%@page import="NET.webserviceX.www.GlobalWeatherSoapStub"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Simple Weather Service</title>
</head>
<body>
	<%
		GlobalWeatherSoapProxy globalWeather = new GlobalWeatherSoapProxy();
	 	out.print(globalWeather.getCitiesByCountry("Sri Lanka"));
	%>
</body>
</html>