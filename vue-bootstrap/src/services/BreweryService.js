import axios from 'axios';


export default {

    retrieve() {
        return axios.get('/breweries')
    },
    get(id) {
        return axios.get(`/breweries/${id}`)
    }
}