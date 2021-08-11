package com.techelevator.dao;

import com.techelevator.model.Beer;
import com.techelevator.model.BeerReview;
import com.techelevator.model.Brewery;
import com.techelevator.model.Reviews;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class ReviewJdbcDAO implements ReviewDAO {
    private JdbcTemplate jdbcTemplate;

    public ReviewJdbcDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Reviews> getBreweryReviews(int id) {

        List<Reviews> reviewList = new ArrayList<>();

        String sql = "SELECT description, stars, title, username " +
                     "FROM brewery_reviews " +
                     "WHERE brewery_id = ?";

        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql, id);

        while (rows.next()) {

            Reviews review = mapRowReviews(rows);
            reviewList.add(review);
        }

        return reviewList;
    }

    @Override
    public List<BeerReview> getBeerReviews(int id) {

        List<BeerReview> reviewList = new ArrayList<>();

        String sql = "SELECT * " +
                     "FROM beer_reviews " +
                     "JOIN beers ON beers.beer_id = beer_reviews.beer_id " +
                     "WHERE beers.beer_id = ? ";

        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql, id);

        while (rows.next()) {

            BeerReview review = mapRowBeerReviews(rows);
            reviewList.add(review);
        }

        return reviewList;
    }

    @Override
    public void addBreweryReview(Reviews review, int id) {

        String sql = "INSERT INTO brewery_reviews (brewery_id, description, stars, title, username) VALUES (?, ?, ?, ?, ?) ";

        jdbcTemplate.update(sql, id, review.getDescription(), review.getStars(), review.getTitle(), review.getUsername());
    }

    @Override
    public void addBeerReview(BeerReview review, int id, int beerId) {

        String sql = "INSERT INTO beer_reviews (beer_id, description, stars, title, username) VALUES (?, ?, ?, ?, ?) ";

        jdbcTemplate.update(sql, id, review.getDescription(), review.getStars(), review.getTitle(), review.getUsername());
    }

    private Reviews mapRowReviews(SqlRowSet rows) {

        Reviews review = new Reviews();

        review.setDescription(rows.getString("description"));
        review.setStars(rows.getInt("stars"));
        review.setTitle(rows.getString("title"));
        review.setUsername(rows.getString("username"));

        return review;
    }

    private BeerReview mapRowBeerReviews(SqlRowSet rows) {

        BeerReview review = new BeerReview();

        review.setDescription(rows.getString("description"));
        review.setOverall(rows.getInt("overall"));
        review.setLook(rows.getInt("look"));
        review.setSmell(rows.getInt("smell"));
        review.setFeel(rows.getInt("feel"));
        review.setTaste(rows.getInt("taste"));
        review.setTitle(rows.getString("title"));
        review.setUsername(rows.getString("username"));
        review.setBeerId(rows.getInt("beer_id"));

        return review;
    }
}



