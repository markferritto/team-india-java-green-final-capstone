import axios from 'axios';

export default {

    retrieveBreweryReviews(review) {
        return axios.post('reviews/breweries/{id}', review)
    },
    retrieveBeerReviews(review) {
        return axios.post('/reviews/breweries/{id}/beer/{beerId}', review)
    },
    addReview(id,review) {
        return axios.post(`/reviews/new/breweries/${id}`,review)
    },
    addReviews(beerReview) {
        return axios.post('/reviews/new/breweries/{id}/beer/{beerId}', review)
    },
    reviewList(id){
        return axios.get(`reviews/breweries/${id}`);
    }

}