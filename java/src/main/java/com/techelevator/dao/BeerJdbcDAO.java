package com.techelevator.dao;

import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component

public class BeerJdbcDAO implements BeerDAO {

    private JdbcTemplate jdbcTemplate;

    public BeerJdbcDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Beer> retrieveBeers(int breweryId) {

        List<Beer> beerList = new ArrayList<>();

        String sqlBeerList = "SELECT beers.beer_id, brewery.brewery_id, beer_type.name AS beer_type, beers.name, beers.description " +
                             "FROM beers " +
                             "JOIN beer_type ON beers.beer_type_id = beer_type.beer_type_id " +
                             "JOIN brewery on brewery.brewery_id = beers.brewery_id " +
                             "WHERE brewery.brewery_id = ?";

        SqlRowSet beerRows = jdbcTemplate.queryForRowSet(sqlBeerList, breweryId);

        while (beerRows.next()) {

            Beer beer = mapRowToBeer(beerRows);

            String sqlBeerAverageRating = "SELECT ROUND(AVG(beer_reviews.stars), 2) AS average_beer_review " +
                                          "FROM beers " +
                                          "JOIN beer_reviews ON beer_reviews.beer_id = beers.beer_id " +
                                          "WHERE beers.beer_id = ?;";

            SqlRowSet reviewRows = jdbcTemplate.queryForRowSet(sqlBeerAverageRating, beer.getBeerId());

            while (reviewRows.next()) {

                beer.setStars(reviewRows.getDouble("average_beer_review"));
            }

            beerList.add(beer);
        }

        return beerList;
    }

    @Override
    public void newBeer(Beer beer, int id) {

        beer.setBeerId(getNextBeerId());

        String sqlNewBeer = "INSERT INTO beers (brewery_id, beer_id, name, beer_type_id, description, ABV) VALUES (?, ?, ?, ?, ?, ?)";

        jdbcTemplate.update(sqlNewBeer, id, beer.getBeerId(), beer.getName(), 1, beer.getDescription(), beer.getABV());

        String updateBeerType = "UPDATE beers " +
                                "SET beer_type_id = beer_type.beer_type_id " +
                                "FROM beer_type " +
                                "WHERE beer_id = ? " +
                                "AND beer_type.name = ?";

        jdbcTemplate.update(updateBeerType, beer.getBeerId(), beer.getBeerType());
    }

    @Override
    public void deleteBeer(int id, int beerId) {

        String sqlNewBeer = "DELETE FROM beers " +
                            "WHERE brewery_id = ? " +
                            "AND beer_id = ?";

        jdbcTemplate.update(sqlNewBeer, id, beerId);
    }

    private Beer mapRowToBeer(SqlRowSet rows) {

        Beer beer = new Beer();

        beer.setBeerId(rows.getInt("beer_id"));
        beer.setBreweryId(rows.getInt("brewery_id"));
        beer.setBeerType(rows.getString("beer_type"));
        beer.setDescription(rows.getString("description"));
        beer.setName(rows.getString("name"));
        beer.setABV(rows.getString("ABV"));

        return beer;
    }

    private int getNextBeerId() {
        SqlRowSet nextIdResult = jdbcTemplate.queryForRowSet("SELECT nextval('seq_beer_id')");

        if (nextIdResult.next()) {
            return nextIdResult.getInt(1);
        } else {
            throw new RuntimeException("Something went wrong while getting an id for the new beer.");
        }
    }
}
