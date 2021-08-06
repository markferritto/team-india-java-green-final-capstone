import axios from 'axios';


export default {

    retrieve() {
        return axios.get('/brewery')
    },
    get(id) {
        return axios.get(`/brewery/${id}`)
    },
    retrieveBeersPerBrewery(id) {
        return axios.get(`/beer/${id}`)
    },

    create(review) {
        return axios.post(`/review`, review)
    }

}