package com.agentmilindu.simple.weather;


import java.io.StringReader;
import java.rmi.RemoteException;
import java.util.List;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import NET.webserviceX.www.GlobalWeatherSoapProxy;

public class SimpleWeather {
	static GlobalWeatherSoapProxy globalWeather = new GlobalWeatherSoapProxy();
	
	public static DataSet getCitiesByCountry(String countryName) {
		try {
			String output = globalWeather.getCitiesByCountry(countryName);
			//DataSet dataSet = unmarshal("<NewDataSet><Table><Country>Sri Lanka</Country><City>Katunayake</City></Table><Table><Country>Sri Lanka</Country><City>Katunayake</City></Table></NewDataSet>");
			DataSet dataSet = unmarshal(output);
			return dataSet;
		} catch (RemoteException e) {
			e.printStackTrace();
			return null;
		}		
	}
		
	private static DataSet unmarshal(String input) {
		try{
			JAXBContext jaxbContext = JAXBContext.newInstance(DataSet.class);
			Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
			StringReader reader = new StringReader(input);
			DataSet countres = (DataSet)jaxbUnmarshaller.unmarshal( reader );
			return countres;
		}
		catch(JAXBException e){
			e.printStackTrace();
			return null;
		}
		
	}

	
}
