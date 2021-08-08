import axios from 'axios';

export default {

    retrieveBreweryReviews(review) {
        return axios.post('reviews/breweries/{id}', review)
    },
    retrieveBeerReviews(review) {
        return axios.post('/reviews/breweries/{id}/beer/{beerId}', review)
    },
    addReview(review) {
        return axios.post('/reviews/new/breweries/{id}', review)
    },
    addReview(beerReview) {
        return axios.post('/reviews/new/breweries/{id}/beer/{beerId}', review)
    }

}