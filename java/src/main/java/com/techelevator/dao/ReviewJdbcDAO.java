package com.techelevator.dao;

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
    public void addReview(Reviews review) {

        String sql = "INSERT INTO reviews (brewery_id, description, stars, title, user_id) VALUES (?, ?, ?, ?, ?) ";

        jdbcTemplate.update(sql, review.getBreweryId(), review.getDescription(), review.getStars(), review.getTitle(), review.getUsername());

    }

    @Override
    public List<Reviews> getAllReviews() {

        List<Reviews> reviewList = new ArrayList<>();

        String sql = " SELECT brewery_id, description, stars, title, username FROM public.reviews;";

        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql);

        while (rows.next()) {

            Reviews review = mapRowReviews(rows);
            reviewList.add(review);
        }

        return reviewList;
    }

    @Override
    public List<Reviews> getReviewsByBreweryId(int id) {

        List<Reviews> reviewList = new ArrayList<>();

        String sql = "SELECT brewery_id, description, stars, title, username " +
                     "FROM public.reviews " +
                     "WHERE brewery_id = ?";

        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql, id);

        while (rows.next()) {

            Reviews review = mapRowReviews(rows);
            reviewList.add(review);
        }

        return reviewList;
    }


    private Reviews mapRowReviews(SqlRowSet rows) {
        Reviews review = new Reviews();

        review.setBreweryId(rows.getInt("brewery_id"));
        review.setDescription(rows.getString("description"));
        review.setStars(rows.getInt("stars"));
        review.setTitle(rows.getString("title"));
        review.setUsername(rows.getString("username"));

        return review;
    }
}



