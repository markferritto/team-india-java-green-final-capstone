import axios from 'axios';


export default {

    retrieve() {
        return axios.get('/breweries')
    },
    get(id) {
        return axios.get(`/breweries/${id}`)
    },
    retrieveBeersPerBrewery(id) {
        return axios.get(`/breweries/${id}/beers`)
    },
    addBeer(beer) {
        return axios.post('/breweries/{id}/new/beer', beer)
    },
    deleteBeer(breweryId, id) {
        return axios.delete('/breweries/{breweryId}/delete/beer/{beerId}')
    },
}