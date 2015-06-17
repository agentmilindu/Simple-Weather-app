package com.agentmilindu.simple.weather;


import java.io.StringReader;
import java.rmi.RemoteException;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import com.agentmilindu.simple.weather.exceptions.NoDataException;

import NET.webserviceX.www.GlobalWeatherSoapProxy;

public class SimpleWeather {
	static GlobalWeatherSoapProxy globalWeather = new GlobalWeatherSoapProxy();
	
	public static DataSet getCitiesByCountry(String countryName) {
		try {
			String output = globalWeather.getCitiesByCountry(countryName);
			DataSet dataSet = (DataSet)unmarshal(output);
			return dataSet;
		} catch (RemoteException e) {
			e.printStackTrace();
			return null;
		}		
	}
	
	public static CurrentWeather getWeather(String cityName, String countryName) throws NoDataException{
		try {
			String output = globalWeather.getWeather(cityName, countryName);
			if("Data Not Found".equals(output)){
				throw new NoDataException();
			}
			else{
				CurrentWeather currentWeather = (CurrentWeather)unmarshal(output);
				return currentWeather;
			}
		} catch (RemoteException e) {
			e.printStackTrace();
			throw new NoDataException();
		}		
	}
	
		
	private static Object unmarshal(String input) {
		try{
			JAXBContext jaxbContext = JAXBContext.newInstance(DataSet.class, CurrentWeather.class);
			Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
			StringReader reader = new StringReader(input);
			return jaxbUnmarshaller.unmarshal( reader );
		}
		catch(JAXBException e){
			e.printStackTrace();
			return null;
		}
		
	}

	
}
