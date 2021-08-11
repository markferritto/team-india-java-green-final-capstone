package com.techelevator.dao;

import com.techelevator.model.BeerReview;
import com.techelevator.model.Reviews;

import java.util.List;

public interface ReviewDAO {

    List<Reviews> getBreweryReviews(int id);

    List<BeerReview> getBeerReviews(int id);

    void addBreweryReview(Reviews review, int id);

    void addBeerReview(BeerReview review, int id, int beerId);
}
