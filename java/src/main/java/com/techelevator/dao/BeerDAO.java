package com.techelevator.dao;

import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;

import java.util.List;

public interface BeerDAO {

    Beer retrieveBeer(int id);

    List<Beer> retrieveBeers(int breweryId);

    List<String> retrieveBeerTypes(int breweryId);

    void newBeer(Beer beer, int id);

    void deleteBeer(int id, int beerId);
}
