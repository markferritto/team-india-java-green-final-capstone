package com.techelevator.dao;

import com.techelevator.model.Reviews;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class ReviewJdbcDAO implements ReviewDAO{
    private JdbcTemplate jdbcTemplate;

    public ReviewJdbcDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public void addReview(Reviews review) {

    String sql="INSERT INTO reviews (brewery_id, description, stars, title, user_id) VALUES (?, ?, ?, ?, ?) ";

        jdbcTemplate.update(sql,review.getBreweryId(),review.getDescription(), review.getStars(),review.getTitle(),review.getUserId());

    }
}


