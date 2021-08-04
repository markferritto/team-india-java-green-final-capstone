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
        String sql = "SELECT brewery.brewery_id, brewery.name, ROUND(AVG(reviews.stars), 2) AS average_beer_rating, brewery.description, type.name AS type_name, brewery.website_url, brewery.phone_number, brewery.street_address, brewery.city, brewery.state, brewery.zip " +
                     "FROM brewery " +
                     "JOIN brewery_beers ON brewery_beers.brewery_id = brewery.brewery_id " +
                     "JOIN beers ON beers.beer_id = brewery_beers.beer_id " +
                     "JOIN reviews ON reviews.beer_id = beers.beer_id " +
                     "JOIN type ON type.type_id = brewery.type_id " +
                     "GROUP BY brewery.brewery_id, type.name";

        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql);

        while (rows.next()) {

            Brewery brewery = mapRowBrewery(rows);

            //Query is to assign the correct beers to the breweries
            String sqlBeer = "SELECT beers.beer_id, beers.name AS beer_name, reviews.stars, beer_type.name AS beer_type, beers.description " +
                             "FROM beers " +
                             "JOIN brewery_beers ON brewery_beers.beer_id = beers.beer_id " +
                             "JOIN reviews ON reviews.beer_id = beers.beer_id " +
                             "JOIN beer_type ON beers.beer_type_id = beer_type.beer_type_id " +
                             "WHERE brewery_id = ?";

            SqlRowSet beerRows = jdbcTemplate.queryForRowSet(sqlBeer, brewery.getBreweryId());

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

    @Override
    public Brewery getBreweryById(int id) {

        Brewery brewery = new Brewery();
        List<Beer> beerList = new ArrayList<>();

        //This will query for all breweries in the database
        String sql = "SELECT brewery.brewery_id, brewery.name, ROUND(AVG(reviews.stars), 2) AS average_beer_rating, brewery.description, type.name AS type_name, brewery.website_url, brewery.phone_number, brewery.street_address, brewery.city, brewery.state, brewery.zip " +
<<<<<<< HEAD
                "FROM brewery " +
                "JOIN brewery_beers ON brewery_beers.brewery_id = brewery.brewery_id " +
                "JOIN beers ON beers.beer_id = brewery_beers.beer_id " +
                "JOIN reviews ON reviews.beer_id = beers.beer_id " +
                "JOIN type ON type.type_id = brewery.type_id " +
                "WHERE brewery.brewery_id = ?" +
                "GROUP BY brewery.brewery_id, type.name";
=======
                     "FROM brewery " +
                     "JOIN brewery_beers ON brewery_beers.brewery_id = brewery.brewery_id " +
                     "JOIN beers ON beers.beer_id = brewery_beers.beer_id " +
                     "JOIN reviews ON reviews.beer_id = beers.beer_id " +
                     "JOIN type ON type.type_id = brewery.type_id " +
                     "WHERE brewery.brewery_id = ?" +
                     "GROUP BY brewery.brewery_id, type.name";
>>>>>>> 1e1bbab9623613e50c0bcdbf8c4e25b05b9eed3d


        SqlRowSet row = jdbcTemplate.queryForRowSet(sql, id);

        while (row.next()) {

            brewery = mapRowBrewery(row);

            //Query is to assign the correct beers to the breweries
            String sqlBeer = "SELECT beers.beer_id, beers.name AS beer_name, reviews.stars, beer_type.name AS beer_type, beers.description " +
                    "FROM beers " +
                    "JOIN brewery_beers ON brewery_beers.beer_id = beers.beer_id " +
                    "JOIN reviews ON reviews.beer_id = beers.beer_id " +
                    "JOIN beer_type ON beers.beer_type_id = beer_type.beer_type_id " +
                    "WHERE brewery_id = ?";

            SqlRowSet beerRows = jdbcTemplate.queryForRowSet(sqlBeer, brewery.getBreweryId());

            while(beerRows.next()){
                Beer beer = mapRowBeer(beerRows);

                beerList.add(beer);
            }
            //Sets the brewer list on the brewery object
            brewery.setBeerList(beerList);

        }

        return brewery;
    }
<<<<<<< HEAD
=======

>>>>>>> 1e1bbab9623613e50c0bcdbf8c4e25b05b9eed3d
    private Brewery mapRowBrewery(SqlRowSet rows) {

        Brewery brewery = new Brewery();

        brewery.setBreweryId(rows.getInt("brewery_id"));
        brewery.setName(rows.getString("name"));
        brewery.setRating(rows.getDouble("average_beer_rating"));
        brewery.setDescription(rows.getString("description"));
        brewery.setTypeName(rows.getString("type_name"));
        brewery.setWebsiteUrl(rows.getString("website_url"));
        brewery.setPhoneNumber(rows.getString("phone_number"));
        brewery.setStreetAddress(rows.getString("street_address"));
        brewery.setCity(rows.getString("city"));
        brewery.setState(rows.getString("state"));
        brewery.setZip(rows.getString("zip"));

        return brewery;
    }

    private Beer mapRowBeer(SqlRowSet rows) {

        Beer beer= new Beer();

        beer.setBeerId(rows.getInt("beer_id"));
        beer.setName(rows.getString("beer_name"));
        beer.setStars(rows.getDouble("stars"));
        beer.setBeerType(rows.getString("beer_type"));
        beer.setDescription(rows.getString("description"));

        return beer;
    }
}