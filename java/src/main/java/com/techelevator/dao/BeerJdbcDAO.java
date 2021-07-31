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
    public List<Beer> retrieveBeers() {
        List<Beer> beerList = new ArrayList<>();
        String sql = "SELECT beer_id, name, description FROM beers";
        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql);
        while (rows.next()) {
            Beer beer = mapRowBeer(rows);
            beerList.add(beer);
        }
        return beerList;
    }

    private Beer mapRowBeer(SqlRowSet rows) {
        Beer beer = new Beer();
        beer.setBeer_id(rows.getInt("beer_id"));
        beer.setName(rows.getString("name"));
        beer.setDescription(rows.getString("description"));

        return beer;
    }


}
