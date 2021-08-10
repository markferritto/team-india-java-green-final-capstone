import axios from 'axios';


export default {

    retrieveBeerPerId(id) {
        return axios.get(`/beers/${id}`)
    },
    retrieveBeersPerBrewery(id) {
        return axios.get(`/breweries/${id}/beers`)
    },
    retrieveBeerTypesPerBrewery(id) {
        return axios.get(`/breweries/${id}/beers/types`)
    },
    addBeer(beer) {
        return axios.post('/breweries/{id}/new/beer/${beerId}', beer)
    },
    deleteBeer(breweryId, id) {
        return axios.delete('/breweries/{breweryId}/delete/beer/{beerId}')
    },
}