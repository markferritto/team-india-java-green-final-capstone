package com.techelevator.model;

public class BeerReview {

    private int overall;
    private int look;
    private int smell;
    private int feel;
    private int taste;
    private int beerId = 0;
    private String title;
    private String username;
    private String description;

    public int getBeerId() {
        return beerId;
    }

    public void setBeerId(int beerId) {
        this.beerId = beerId;
    }

    public int getStars() {
        return overall;
    }

    public void setStars(int overall) {
        this.overall = overall;
    }

    public int getOverall() {
        return overall;
    }

    public void setOverall(int overall) {
        this.overall = overall;
    }

    public int getLook() {
        return look;
    }

    public void setLook(int look) {
        this.look = look;
    }

    public int getSmell() {
        return smell;
    }

    public void setSmell(int smell) {
        this.smell = smell;
    }

    public int getFeel() {
        return feel;
    }

    public void setFeel(int feel) {
        this.feel = feel;
    }

    public int getTaste() {
        return taste;
    }

    public void setTaste(int taste) {
        this.taste = taste;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
