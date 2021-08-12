package com.techelevator.model;

public class Beer {
    private int beerId;
    private int breweryId;
    private String ABV;
    private String name;
    private double stars;
    private String beerType;
//    private String beerTypeDescription;
    private String description;

    public int getBeerId() {
        return beerId;
    }

    public void setBeerId(int beerId) {
        this.beerId = beerId;
    }

    public int getBreweryId() {
        return breweryId;
    }

    public void setBreweryId(int breweryId) {
        this.breweryId = breweryId;
    }

    public String getABV() {
        return ABV;
    }

    public void setABV(String ABV) {
        this.ABV = ABV;
    }

    public double getStars() {
        return stars;
    }

    public void setStars(double stars) {
        this.stars = stars;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBeerType() {
        return beerType;
    }

    public void setBeerType(String beerType) {
        this.beerType = beerType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

//    public String getBeerTypeDescription() {
//        return beerTypeDescription;
//    }
//
//    public void setBeerTypeDescription(String beerTypeDescription) {
//        this.beerTypeDescription = beerTypeDescription;
//    }
}
