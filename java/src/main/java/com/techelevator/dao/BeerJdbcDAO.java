package com.techelevator.dao;

import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;


@Component

public class BeerJdbcDAO implements BeerDAO{

    private JdbcTemplate jdbcTemplate;

    public BeerJdbcDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }



    @Override
    public List<Beer> retrieveBeers(int breweryId) {
        List<Beer> beerList = new ArrayList<>();
        String sql = "SELECT beers.beer_id, brewery.brewery_id, beer_type.name AS beerType, beers.name, beers.description " +
                     "FROM beers " +
                     "JOIN beer_type ON beers.beer_type_id = beer_type.beer_type_id " +
//                     "JOIN reviews ON reviews.beer_id = beers.beer_id " + , reviews.stars
                     "JOIN brewery on brewery.brewery_id = beers.brewery_id " +
                     "WHERE brewery.brewery_id = ?";

//        SELECT beer_id, brewery.brewery_id, beer_type.name, beers.name, beers.description
//        FROM beers
//        JOIN beer_type ON beers.beer_type_id = beer_type.beer_type_id
//        JOIN brewery on brewery.brewery_id = beers.brewery_id
//        WHERE brewery.brewery_id = ?;

        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql, breweryId);
        while (rows.next()) {
            Beer beer = mapRowToBeer(rows);
            beerList.add(beer);
        }
        return beerList;
    }


    private Beer mapRowToBeer(SqlRowSet rows) {
        Beer beer = new Beer();
        beer.setBeerId(rows.getInt("beer_id"));
        beer.setBreweryId(rows.getInt("brewery_id"));
//        beer.setStars(rows.getDouble("stars"));
        beer.setBeerType(rows.getString("beerType"));
        beer.setName(rows.getString("name"));
        beer.setDescription(rows.getString("description"));

        return beer;
    }

}
