<template>
  <div>
  <div class="container">
    <div class="row">
      <div
        class="col-sm-4 py-3"
        v-for="brewery in filteredBreweries"
        v-on:click="sendToBrewery(brewery.breweryId)"
        v-bind:key="brewery.breweryId"
      >
        <div class="card card-body h-100" style="width: 18rem">
          <img class="card-img-top" src="/img/bg1.jpg" alt="Card image cap" />
          <div class="card-body">
            <h5 class="card-title">{{ brewery.name }}</h5>
            <p class="card-text description">
              {{ brewery.description }}
            </p>
          </div>
          <ul class="list-group list-group-flush">
            <li class="list-group-item">{{ brewery.typeName }}</li>
            <li class="list-group-item">
              {{ brewery.streetAddress }}. {{ brewery.city }},
              {{ brewery.state }}
              {{ brewery.zip }}
            </li>
            <li class="list-group-item">
              <a href="#">
                <div class="stars">
                  <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                  <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                  {{ brewery.rating }}
                </div>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  
  <div class="openContainer">
    <div class="row">
      <div
        class="col-sm-4 py-3"
        v-for="brewery in openBreweries"
        v-on:click="sendToOpenBrewery(brewery.breweryId)"
        v-bind:key="brewery.breweryId"
      >
        <div class="card card-body h-100" style="width: 18rem">
          <img class="card-img-top" src="/img/bg1.jpg" alt="Card image cap" />
          <div class="card-body">
            <h5 class="card-title">{{ brewery.name }}</h5>
            <p class="card-text description">
              {{ brewery.description }}
            </p>
          </div>
          <ul class="list-group list-group-flush">
            <li class="list-group-item">{{ brewery.brewery_type }}</li>
            <li class="list-group-item">
              {{ brewery.street }}. {{ brewery.city }},
              {{ brewery.state }}
              {{ brewery.postalCode }}
            </li>
            <li class="list-group-item">
              <a href="#">
                <div class="stars">
                  <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                  <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                  {{ brewery.rating }}
                </div>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  </div>
</template>

<script>
import breweryService from "../services/BreweryService.js";

export default {
  name: "brewery-search",
  data() {
    return {
      breweryFilter: "",
      breweries: [],
      isLoading: true,
      openBreweries: [],
    };
  },
  computed: {
    filteredBreweries() {
      return this.breweries.filter((brewery) => {
        return this.breweryFilter == ""
          ? true
          : this.breweryFilter == brewery.name;
      });
    },
  },
  methods: {
    sendToBrewery(breweryId) {
      this.$router.push(`/brewery/${breweryId}`);
    },
    sendToOpenBrewery(website_url) {
      this.$router.push(`${website_url}`);
    }
  },
  created() {
    breweryService.retrieve().then((response) => {
      this.breweries = response.data;
      this.isLoading = false;
    });
    fetch('https://api.openbrewerydb.org/breweries?by_state=ohio&by_city=columbus&per_page=50')
  .then((response) => {
      if (response.status !== 200) {
        console.log('Looks like there was a problem. Status Code: ' +
          response.status);
        return;
      }

      // Examine the text in the response
      response.json().then((data) => {
        this.brewery = data;
        this.breweryList = JSON.parse(JSON.stringify(data));
        this.breweryList.forEach(brewery => {
        this.breweryId = brewery.id;
        this.name = brewery.name;
        this.typeName = brewery.brewery_type;
        this.streetAddress = brewery.street;
        this.city = brewery.city;
        this.state = brewery.state;
        this.zip = brewery.zip;
        this.websiteUrl = brewery.website_url;
        this.openBreweries.push(brewery);
        });
      });
  },
  )
  .catch((err) => {
    console.log('Fetch Error', err);
  });
  }
};
</script>

<style>
@import url("https://fonts.googleapis.com/css?family=Open+Sans&display=swap");

.ratings {
  background-color: #fff;
  padding: 54px;
  border: 1px solid rgba(0, 0, 0, 0.1);
  box-shadow: 0px 10px 10px #e0e0e0;
}

.product-rating {
  font-size: 50px;
}

.stars i {
  font-size: 18px;
  color: #28a745;
}

.rating-text {
  margin-top: 10px;
}
</style>