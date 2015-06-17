<%@page import="com.agentmilindu.simple.weather.exceptions.NoDataException"%>
<%@page import="com.agentmilindu.simple.weather.CurrentWeather"%>
<%@page import="com.agentmilindu.simple.weather.Table"%>
<%@page import="com.agentmilindu.simple.weather.DataSet"%>
<%@page import="com.agentmilindu.simple.weather.SimpleWeather"%>
<%@page import="NET.webserviceX.www.GlobalWeatherSoapProxy"%>
<%@page import="NET.webserviceX.www.GlobalWeatherLocator"%>
<%@page import="NET.webserviceX.www.GlobalWeatherSoapStub"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Simple Weather Service</title>
        <meta name="description" content="A simple weather app">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="css/normalize.min.css">
        <link rel="stylesheet" href="css/main.css">

        <script src="js/vendor/modernizr-2.8.3.min.js"></script>
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <div class="header-container">
            <header class="wrapper clearfix">
                <h1 class="title">Simple Weather App</h1>
                <nav>
                    <ul>
                        <li><a href="#">Report</a></li>
                        <li><a href="#">About</a></li>
                    </ul>
                </nav>
            </header>
        </div>

        <div class="main-container">
            <div class="main wrapper clearfix">

                <article>
                    <header>
	                    <%
							GlobalWeatherSoapProxy globalWeather = new GlobalWeatherSoapProxy();
							DataSet dataSet = (DataSet)SimpleWeather.getCitiesByCountry("Sri Lanka");
							List<Table> tables = dataSet.getTables();
							for(int i = 0; i < tables.size(); i++){
								Table table =  tables.get(i);
						%>
                        <h1><%=table.getCity() %></h1>
                    </header>
                    <ul>
                    <%
							try{
								CurrentWeather currentWeather =  SimpleWeather.getWeather(table.getCity(), "Sri Lanka");
					
					%>
							<li>Temperature : <%= currentWeather.getTemperature() %></li>
							<li>Pressure : <%= currentWeather.getPressure() %></li>
							<li>Relative Humidity : <%= currentWeather.getRelativeHumidity() %></li>
							<li>Sky Conditions : <%= currentWeather.getSkyConditions() %></li>
							<li>Wind : <%= currentWeather.getWind() %></li>
							<li>Visibility : <%= currentWeather.getVisibility() %></li>
					<%
							}
							catch( NoDataException e){
								
					%>
						<li>No data found</li>
					<%
							}
                    %>
					</ul>
				<% } %>
                </article>

            </div> <!-- #main -->
        </div> <!-- #main-container -->

        <div class="footer-container">
            <footer class="wrapper">
                <h3>Milindu Sanoj Kumarage</h3>
            </footer>
        </div>

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

        <script src="js/main.js"></script>
    </body>
</html>
