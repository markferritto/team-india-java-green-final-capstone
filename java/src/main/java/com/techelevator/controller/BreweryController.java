package com.techelevator.controller;

import com.techelevator.dao.BreweryDAO;
import com.techelevator.model.Brewery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin

@PreAuthorize("isAuthenticated()")
@RestController
public class BreweryController {

    @Autowired
    private BreweryDAO breweryDAO;

    //Method retrieves a list of breweries from the database
    @PreAuthorize("permitAll")
    @RequestMapping(path = "brewery", method = RequestMethod.GET)
    public List<Brewery> retrieveBreweries() {
        return breweryDAO.getAllBreweries();
    }

<<<<<<< HEAD
=======
    //Method retrieves a specific brewery
>>>>>>> 1e1bbab9623613e50c0bcdbf8c4e25b05b9eed3d
    @PreAuthorize("permitAll")
    @RequestMapping(path = "brewery/{id}", method = RequestMethod.GET)
    public Brewery retrieveBreweries(@PathVariable int id) {
        return breweryDAO.getBreweryById(id);
    }
}