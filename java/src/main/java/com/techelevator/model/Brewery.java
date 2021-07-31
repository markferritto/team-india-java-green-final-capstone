package com.techelevator.model;

import java.util.List;

public class Brewery {
    private int brewery_id;
    private String name;
    private String description;
    private String address;
    private List<Brewer> brewers;


    public List<Brewer> getBrewers() {
        return brewers;
    }

    public void setBrewers(List<Brewer> brewers) {
        this.brewers = brewers;
    }

    public int getBrewery_id() {
        return brewery_id;
    }

    public void setBrewery_id(int brewery_id) {
        this.brewery_id = brewery_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}