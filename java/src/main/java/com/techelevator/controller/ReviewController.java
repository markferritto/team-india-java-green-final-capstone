package com.techelevator.controller;

import com.techelevator.dao.BreweryDAO;
import com.techelevator.dao.ReviewDAO;
import com.techelevator.model.Reviews;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@CrossOrigin
@PreAuthorize("isAuthenticated()")
@RestController
public class ReviewController {

    @Autowired
    private ReviewDAO reviewDAO;



    @PreAuthorize("permitAll")

    @ResponseStatus(HttpStatus.CREATED)
        @RequestMapping(path = "/review", method = RequestMethod.POST)
        public void addReview(@RequestBody Reviews review) {
            reviewDAO.addReview(review);
        }
}
