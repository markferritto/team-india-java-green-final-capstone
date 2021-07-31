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

        String sql = "SELECT brewery_id, name, description, address FROM brewery";

        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql);

        while (rows.next()) {

            Brewery brewery = mapRowBrewery(rows);

            breweryList.add(brewery);
        }

        return breweryList;
    }


    private Brewery mapRowBrewery(SqlRowSet rows) {

        Brewery brewery = new Brewery();

        brewery.setBrewery_id(rows.getInt("brewery_id"));
        brewery.setName(rows.getString("name"));
        brewery.setDescription(rows.getString("description"));
        brewery.setAddress(rows.getString("address"));

        return brewery;
    }


}