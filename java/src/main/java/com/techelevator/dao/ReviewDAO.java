package com.techelevator.dao;

import com.techelevator.model.Reviews;

import java.util.List;

public interface ReviewDAO {

    List<Reviews> getBreweryReviews(int id);

    List<Reviews> getBeerReviews(int id, int beerId);

    void addBreweryReview(Reviews review, int id);

    void addBeerReview(Reviews review, int id, int beerId);
}
