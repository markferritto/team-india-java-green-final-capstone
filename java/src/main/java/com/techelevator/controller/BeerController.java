package com.techelevator.controller;


import com.techelevator.dao.BeerDAO;
import com.techelevator.dao.BreweryDAO;
import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@CrossOrigin
@PreAuthorize("isAuthenticated()")
@RestController
public class BeerController {

    @Autowired
    private BeerDAO beerDAO;

    //Method retrieves a list of beers from the database
    @PreAuthorize("permitAll")
    @RequestMapping(path = "beer/{id}", method = RequestMethod.GET)
    public List<Beer> getBeerList(@PathVariable int id) { return beerDAO.retrieveBeers(id);
    }
}
