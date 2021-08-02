package com.techelevator.dao;

import com.techelevator.model.Brewer;
import com.techelevator.model.Brewery;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class BreweryJdbcDAO implements BreweryDAO {

    private JdbcTemplate jdbcTemplate;

    public BreweryJdbcDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Brewery> getAllBreweries() {

        List<Brewery> breweryList = new ArrayList<>();
        List<Brewer> brewerList = new ArrayList<>();

        //This will query for all breweries in the database
        String sql = "SELECT brewery_id, name, description, type_id, website_url, phone_number, street_address, city, state, zip FROM  brewery";

        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql);

        while (rows.next()) {

            Brewery brewery = mapRowBrewery(rows);

//            //Query is to assign the correct brewers to the breweries
//            String sqlBrewer = "SELECT brewer_id, name, description, brewery_id " +
//                               "FROM brewer " +
//                               "WHERE brewery_id=?";
//
//            SqlRowSet brewerRows = jdbcTemplate.queryForRowSet(sqlBrewer, brewery.getBrewery_id());
//
//            while(brewerRows.next()){
//                Brewer brewer = mapRowBrewer(brewerRows);
//
//                brewerList.add(brewer);
//            }
//            //Sets the brewer list on the brewery object
//            brewery.setBrewers(brewerList);
//
//            //Adds brewery to list that will be returned
            breweryList.add(brewery);
        }
        return breweryList;
    }

    private Brewery mapRowBrewery(SqlRowSet rows) {

        Brewery brewery = new Brewery();

        brewery.setBrewery_id(rows.getInt("brewery_id"));
        brewery.setName(rows.getString("name"));
        brewery.setDescription(rows.getString("description"));
        brewery.setType_id(rows.getInt("type_id"));
        brewery.setWebsite_url(rows.getString("website_url"));
        brewery.setPhone_number(rows.getString("phone_number"));
        brewery.setStreet_address(rows.getString("street_address"));
        brewery.setCity(rows.getString("city"));
        brewery.setState(rows.getString("state"));
        brewery.setZip(rows.getString("zip"));

        return brewery;
    }
    private Brewer mapRowBrewer(SqlRowSet rows) {
        Brewer brewer = new Brewer();
        brewer.setBrewer_id(rows.getInt("brewer_id"));
        brewer.setName(rows.getString("name"));
        brewer.setDescription(rows.getString("description"));
        brewer.setBrewery_id(rows.getInt("brewery_id"));
        return brewer;
    }
}