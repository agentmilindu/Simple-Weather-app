package com.agentmilindu.simple.weather;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Table {

    private String Country;

    private String City;

	public String getCountry() {
		return Country;
	}

	public void setCountry(String country) {
		Country = country;
	}

	public String getCity() {
		return City;
	}

	public void setCity(String city) {
		City = city;
	}
    
}


