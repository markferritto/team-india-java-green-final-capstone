package com.techelevator.dao;

import com.techelevator.model.Reviews;

import java.util.List;

public interface ReviewDAO {

    void addReview(Reviews review);

    List<Reviews> getAllReviews();

    List<Reviews> getReviewsByBreweryId(int id);
}
