<%@page import="com.agentmilindu.simple.weather.Table"%>
<%@page import="com.agentmilindu.simple.weather.DataSet"%>
<%@page import="com.agentmilindu.simple.weather.SimpleWeather"%>
<%@page import="NET.webserviceX.www.GlobalWeatherSoapProxy"%>
<%@page import="NET.webserviceX.www.GlobalWeatherLocator"%>
<%@page import="NET.webserviceX.www.GlobalWeatherSoapStub"%>
<%@page import="java.util.List"%>
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
		DataSet dataSet = (DataSet)SimpleWeather.getCitiesByCountry("Sri Lanka");
		List<Table> tables = dataSet.getTables();
		for(int i = 0; i < tables.size(); i++){
			Table table =  tables.get(i);
			
		}
	 	out.print(dataSet.getTables().size());
	 	
	%>
</body>
</html>