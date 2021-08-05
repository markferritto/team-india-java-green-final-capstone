package com.techelevator.dao;

import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;

import java.util.List;

public interface BeerDAO {

    List<Beer> retrieveBeers(int breweryId);


}
