import axios from 'axios';

export default {

    reviewList(id){
        return axios.get(`reviews/breweries/${id}`);
    },
    retrieveBeerReviews(id) {
        return axios.post(`/reviews/breweries/${id}/beer`)
    },
    addReview(id, review) {
        return axios.post(`/reviews/new/breweries/${id}`, review)
    },
    addReviews(id, beerId, review) {
        return axios.post(`/reviews/new/breweries/${id}/beer/${beerId}`, review)
    },


}