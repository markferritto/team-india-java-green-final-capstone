package com.techelevator.dao;

import com.techelevator.model.Brewer;
import com.techelevator.model.Brewery;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class BrewerJdbcDAO implements BrewerDAO{

    private JdbcTemplate jdbcTemplate;

    public BrewerJdbcDAO(JdbcTemplate jdbcTemplate) { this.jdbcTemplate = jdbcTemplate; }

    @Override
    public List<Brewer> retrieveBrewers() {

        List<Brewer> brewerList = new ArrayList<>();

        String sql = "SELECT brewer_id, name, description, brewery_id FROM brewer";

        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql);

        while (rows.next()) {

            Brewer brewer = mapRowBrewer(rows);

            brewerList.add(brewer);
        }

        return brewerList;
    }

    private Brewer mapRowBrewer(SqlRowSet rows) {

        Brewer brewer = new Brewer();

        brewer.setBrewery_id(rows.getInt("brewer_id"));
        brewer.setName(rows.getString("name"));
        brewer.setDescription(rows.getString("description"));
        brewer.setBrewery_id(rows.getInt("brewery_id"));

        return brewer;
    }




}
