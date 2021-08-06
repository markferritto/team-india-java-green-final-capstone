<template>
  <div
    class="brewery"
    
    v-bind:key="brewery.id"
  >
    <h1>{{ brewery.name }}</h1>
    <h3>{{ brewery.description }}</h3>
    <h3>{{ brewery.typeName }}</h3>
    <p>{{ brewery.websiteUrl }}</p>
    <p>{{ brewery.phoneNumber }}</p>
    <p>{{ brewery.streetAddress }}</p>
    <p>{{ brewery.city }}, {{ brewery.state }}</p>
    <p>{{ brewery.zip }}</p>
        <h3>Beers</h3>
    <p>{{beers[0].name}}: {{beers[0].description}}  </p>
    <p>{{beers[1].name}}: {{beers[1].description}}</p>
    <p>{{beers[2].name}}:  {{beers[2].description}}</p>

<div id="addHomeform">


    <form v-on:submit.prevent="submitForm" class="homeForm">
 
    
      <div class="form-group">
        <label for="address">description:</label>
        <input id="address" type="text" class="form-control" v-model="review.description" />
      </div>

      <!-- <div class="form-group">
        <label for="city">stars:</label>
        <input id="city" type="text" class="form-control" v-model="review.stars" />
      </div> -->

      <div class="form-group">
        <label for="state">title:</label>
        <input id="state" type="text" class="form-control" v-model="review.title" />
      </div>

     

      <button class="btn btn-submit">Submit</button>
      <button class="btn btn-cancel" type="cancel">Cancel</button>
    </form>
  </div>




  </div>
</template>

<script>
import breweryService from "../services/BreweryService.js";
export default {
  name: "brewery-display",
  
  
  data() {
    return {
      brewery: {},
      beers: [],
      isLoading: true,
    errorMsg: '',

 review:{
// description:"",
// stars:4,
// title:"",
// user_id:2
      }
    };
  },
  created() {
    breweryService.get(this.$route.params.id).then((response) => {
      this.brewery = response.data;
    });
    breweryService.retrieveBeersPerBrewery(this.$route.params.id).then((response) => {
      this.beers = response.data;
    });
  },
methods: {
      
      submitForm() {
          //add a home by calling the homeService
          breweryService.create(this.review).then(response => {
              if (response.status == 201) {
                  //route to search page
                  this.$router.push(`brewery/{id}`);
              }
          }).catch(error => {
              //handle the error
              this.handleErrorResponse(error);
          });
      },
      handleErrorResponse(error) {
        if (error.response) {
            this.errorMsg = "Error adding a new home. Error: " + error.response.status;
        }
        else if (error.request) {
               this.errorMsg = "Error adding a new home. Server unavailable, Error: " + error.status;
        }
        else {
            this.errorMsg = "Java Green has left you high and dry. Pick better developers next time!";
        }
      }
  }

};
</script>

<style scoped>
h1 {
  font-size: 70px;
}
</style>