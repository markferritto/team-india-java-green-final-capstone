import axios from 'axios';

export default {

    retrieve() {
        return axios.get('/brewery')
    },
}