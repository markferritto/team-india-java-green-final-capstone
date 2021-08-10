import axios from 'axios';

export default {

    reviewList(id) {
        return axios.get(`reviews/breweries/${id}`);
    },
    retrieveBeerReviews(id) {
        return axios.get(`/reviews/beer/${id}`)
    },
    addReview(id, review) {
        return axios.post(`/reviews/new/breweries/${id}`, review)
    },
    addBeerReview(id, beerId, review) {
        return axios.post(`/reviews/new/breweries/${id}/beer/${beerId}`, review)
    },


}