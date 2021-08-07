package com.techelevator.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus( code = HttpStatus.NOT_FOUND, reason = "Home not found.")
public class BeerNotFoundException extends Exception{
    private static final long serialVersionUID = 1L;

    public BeerNotFoundException() {
        super("Beer not found.");
    }
}
