package com.techelevator.dao;

import com.techelevator.model.Beer;
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
    public List<Beer> retrieveBeers() {
        List<Beer> beerList = new ArrayList<>();
        String sql = "SELECT beers.beer_id, beers.name, beer_type.name, beers.description " +
                     "FROM beers " +
                     "JOIN beer_type ON beers.beer_type_id = beer_type.beer_type_id";
        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql);
        while (rows.next()) {
            Beer beer = mapRowBeer(rows);
            beerList.add(beer);
        }
        return beerList;
    }

    private Beer mapRowBeer(SqlRowSet rows) {
        Beer beer = new Beer();
        beer.setBeerId(rows.getInt("beer_id"));
        beer.setBeerType(rows.getString("beer_type.name"));
        beer.setName(rows.getString("name"));
        beer.setDescription(rows.getString("description"));

        return beer;
    }


}
