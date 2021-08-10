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

        //This will query for all breweries in the database
        String sql = "SELECT brewery.brewery_id, brewery.name, ROUND(AVG(brewery_reviews.stars), 2) AS average_brewery_rating, brewery.description, type.name AS type_name, brewery.website_url, brewery.phone_number, brewery.street_address, brewery.city, brewery.state, brewery.zip " +
                     "FROM brewery " +
                     "JOIN beers ON beers.brewery_id = brewery.brewery_id " +
                     "JOIN brewery_reviews ON brewery_reviews.brewery_id = brewery.brewery_id " +
                     "JOIN type ON type.type_id = brewery.type_id " +
                     "GROUP BY brewery.brewery_id, type.name";

        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql);

        while (rows.next()) {

            Brewery brewery = mapRowBrewery(rows);

            //Adds brewery to list that will be returned
            breweryList.add(brewery);
        }

        return breweryList;
    }

    @Override
    public Brewery getBreweryById(int id) {

        Brewery brewery = new Brewery();

        //This will query for all breweries in the database
        String sql = "SELECT brewery.brewery_id, brewery.name, ROUND(AVG(brewery_reviews.stars), 2) AS average_brewery_rating, brewery.description, type.name AS type_name, brewery.website_url, brewery.phone_number, brewery.street_address, brewery.city, brewery.state, brewery.zip " +
                     "FROM brewery " +
                     "JOIN beers ON beers.brewery_id = brewery.brewery_id " +
                     "JOIN brewery_reviews ON brewery_reviews.brewery_id = brewery.brewery_id " +
                     "JOIN type ON type.type_id = brewery.type_id " +
                     "WHERE brewery.brewery_id = ?" +
                     "GROUP BY brewery.brewery_id, type.name";

        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql, id);

        while (rows.next()) {

            brewery = mapRowBrewery(rows);
        }

        return brewery;
    }

    private Brewery mapRowBrewery(SqlRowSet rows) {

        Brewery brewery = new Brewery();

        brewery.setBreweryId(rows.getInt("brewery_id"));
        brewery.setName(rows.getString("name"));
        brewery.setRating(rows.getDouble("average_brewery_rating"));
        brewery.setDescription(rows.getString("description"));
        brewery.setBrewery_type(rows.getString("type_name"));
        brewery.setWebsiteUrl(rows.getString("website_url"));
        brewery.setPhoneNumber(rows.getString("phone_number"));
        brewery.setStreetAddress(rows.getString("street_address"));
        brewery.setCity(rows.getString("city"));
        brewery.setState(rows.getString("state"));
        brewery.setZip(rows.getString("zip"));

        return brewery;
    }
}