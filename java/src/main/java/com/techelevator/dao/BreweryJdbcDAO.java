package com.techelevator.dao;

import com.techelevator.model.Beer;
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
        List<Beer> beerList = new ArrayList<>();


        //This will query for all breweries in the database
        String sql = "SELECT brewery.brewery_id, brewery.name, brewery.description, type.name, brewery.website_url, brewery.phone_number, brewery.street_address, brewery.city, brewery.state, brewery.zip " +
                "FROM brewery " +
                "JOIN type ON type.type_id = brewery.type_id";

        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql);

        while (rows.next()) {

            Brewery brewery = mapRowBrewery(rows);

            //Query is to assign the correct brewers to the breweries
            String sqlBeer = "SELECT beers.beer_id, name, description " +
                    "FROM beers " +
                    "JOIN brewery_beers ON brewery_beers.beer_id = beers.beer_id " +
                    "WHERE brewery_id = ?";

            SqlRowSet beerRows = jdbcTemplate.queryForRowSet(sqlBeer, brewery.getBrewery_id());

            while(beerRows.next()){
                Beer beer = mapRowBeer(beerRows);

                beerList.add(beer);
            }
            //Sets the brewer list on the brewery object
            brewery.setBeerList(beerList);

            //Adds brewery to list that will be returned
            breweryList.add(brewery);
        }
        return breweryList;
    }

    private Brewery mapRowBrewery(SqlRowSet rows) {

        Brewery brewery = new Brewery();

        brewery.setBrewery_id(rows.getInt("brewery_id"));
        brewery.setName(rows.getString("name"));
        brewery.setDescription(rows.getString("description"));
       // brewery.setTypeName(rows.getString("type.name"));
        brewery.setWebsite_url(rows.getString("website_url"));
        brewery.setPhone_number(rows.getString("phone_number"));
        brewery.setStreet_address(rows.getString("street_address"));
        brewery.setCity(rows.getString("city"));
        brewery.setState(rows.getString("state"));
        brewery.setZip(rows.getString("zip"));

        return brewery;
    }

    private Beer mapRowBeer(SqlRowSet rows) {

        Beer beer= new Beer();

        beer.setBeer_id(rows.getInt("beer_id"));
        beer.setName(rows.getString("name"));
        beer.setDescription(rows.getString("description"));

        return beer;
    }

}