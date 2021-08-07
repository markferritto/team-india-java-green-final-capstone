package com.techelevator.controller;


import com.techelevator.dao.BeerDAO;
import com.techelevator.model.Beer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.nio.file.Path;
import java.util.List;


@CrossOrigin
@PreAuthorize("isAuthenticated()")
@RestController
public class BeerController {

    @Autowired
    private BeerDAO beerDAO;

    //Method retrieves a list of beers from the database
    @PreAuthorize("permitAll")
    @RequestMapping(path = "/breweries/{id}/beers", method = RequestMethod.GET)
    public List<Beer> getBeerList(@PathVariable int id) { return beerDAO.retrieveBeers(id);
    }

    @PreAuthorize("permitAll")
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/breweries/{id}/new/beer", method = RequestMethod.POST)
    public void createNewBeer(@RequestBody Beer beer, @PathVariable int id) {
        beerDAO.newBeer(beer, id);
    }
}
