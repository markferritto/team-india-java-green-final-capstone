<template>
  <div
    class="brewery"
<<<<<<< HEAD
    
    v-bind:key="brewery.id"
=======
    v-bind:key="brewery.breweryId"
>>>>>>> 1e1bbab9623613e50c0bcdbf8c4e25b05b9eed3d
  >
    <!-- <h1>{{ brewery.name }}</h1> -->
    <h3>{{ brewery.description }}</h3>
        <h3>{{ brewery.typeName }}</h3>

    <p>{{ brewery.address }}</p>
    <p>{{ brewery.beers }}</p>
  </div>
</template>

<script>
import breweryService from "../services/BreweryService.js";
export default {
  name: "brewery-display",
<<<<<<< HEAD
  // prop: ['breweries'],
  data() {
    return {
      brewery: {},
      isLoading: true,
=======
  data() {
    return {
      brewery: {
        name: "",
        rating: "",
        description: "",
        typeName: "",
        websiteUrl: "",
        phoneNumber: "",
        streetAddress: "",
        city: "",
        state: "",
        zip: "",
        beerList: {
          beerId: "",
          name: "", 
          stars: "",
          beerType: "",
          description: ""
        }
      },
>>>>>>> 1e1bbab9623613e50c0bcdbf8c4e25b05b9eed3d
    };
  },
  created() {
    breweryService.get(this.$route.params.id).then((response) => {
      this.brewery = response.data;
    });
  }
};

</script>

<style>
</style>