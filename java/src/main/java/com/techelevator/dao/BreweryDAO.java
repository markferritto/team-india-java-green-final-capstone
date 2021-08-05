package com.techelevator.dao;

import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;

import java.util.List;

public interface BreweryDAO {

    List<Brewery> getAllBreweries();

    Brewery getBreweryById(int id);
//
//    public Beer getBeersByBreweryId(int id);

}
