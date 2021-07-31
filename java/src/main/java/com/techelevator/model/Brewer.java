package com.techelevator.model;

public class Brewer {
    private int brewer_id;
    private String name;
    private String description;
    private int brewery_id;

    public int getBrewer_id() {
        return brewer_id;
    }

    public void setBrewer_id(int brewer_id) {
        this.brewer_id = brewer_id;
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

    public int getBrewery_id() {
        return brewery_id;
    }

    public void setBrewery_id(int brewery_id) {
        this.brewery_id = brewery_id;
    }
}
