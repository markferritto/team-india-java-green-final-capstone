package com.techelevator.controller;

import com.techelevator.dao.BrewerDAO;
import com.techelevator.dao.BreweryDAO;
import com.techelevator.model.Brewer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin
@RestController
@PreAuthorize("isAuthenticated()")
public class BrewerController {

    @Autowired
    private BrewerDAO brewerDAO;

    //Method retrieves a list of brewers from the database
    @PreAuthorize("permitAll")
    @RequestMapping(path = "brewer", method = RequestMethod.GET)
    public List<Brewer> retrieveBrewers() {
        return brewerDAO.retrieveBrewers();
    }
}
