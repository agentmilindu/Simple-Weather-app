package com.agentmilindu.simple.weather;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement( name = "NewDataSet" )
@XmlAccessorType (XmlAccessType.FIELD)
public class DataSet {
	
	@XmlElement(name = "Table")
	private List<Table> tables = null;
    
    public void setTables( List<Table> tables )
    {
        this.tables = tables;
    }
    
    public List<Table> getTables()
    {
        return tables;
    }
}
