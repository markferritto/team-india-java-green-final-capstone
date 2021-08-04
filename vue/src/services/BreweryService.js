import axios from 'axios';


export default {

    retrieve() {
        return axios.get('/brewery')
    },
    get(id) {
        return axios.get(`/brewery/${id}`)
      }
}