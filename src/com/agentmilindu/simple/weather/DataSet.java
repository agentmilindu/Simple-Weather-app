package com.agentmilindu.simple.weather;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement( name = "NewDataSet" )
public class DataSet {
	List<Table> tables;
    

    @XmlElement( name = "Table" )
    public void setTables( List<Table> tables )
    {
        this.tables = tables;
    }
    public List<Table> getTables()
    {
        return this.tables;
    }
}
