package com.techelevator.controller;

import com.techelevator.dao.BreweryDAO;
import com.techelevator.dao.ReviewDAO;
import com.techelevator.model.Brewery;
import com.techelevator.model.Reviews;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@PreAuthorize("isAuthenticated()")
@RestController
public class ReviewController {

    @Autowired
    private ReviewDAO reviewDAO;

    @PreAuthorize("permitAll")
    @RequestMapping(path = "reviews/breweries/{id}", method = RequestMethod.GET)
    public List<Reviews> retrieveBreweryReviews(@PathVariable int id) {
        return reviewDAO.getBreweryReviews(id);
    }

    @PreAuthorize("permitAll")
    @RequestMapping(path = "reviews/beer/{id}", method = RequestMethod.GET)
    public List<Reviews> retrieveBeerReviews(@PathVariable int id) {
        return reviewDAO.getBeerReviews(id);
    }

    @PreAuthorize("permitAll")
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/reviews/new/breweries/{id}", method = RequestMethod.POST)
    public void addBreweryReview(@RequestBody Reviews review, @PathVariable int id) {
        reviewDAO.addBreweryReview(review, id);
    }

    @PreAuthorize("permitAll")
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/reviews/new/breweries/{id}/beer/{beerId}", method = RequestMethod.POST)
    public void addBeerReview(@RequestBody Reviews review, @PathVariable int id, @PathVariable int beerId) {
        reviewDAO.addBeerReview(review, id, beerId);
    }
}
