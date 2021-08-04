<template>
  <div
    class="brewery"
    v-bind:key="brewery.breweryId"
  >
    <h1>{{ brewery.name }}</h1>
    <h3>{{ brewery.description }}</h3>
    <p>{{ brewery.address }}</p>
    <p>{{ brewery.beers }}</p>
  </div>
</template>

<script>
import breweryService from "../services/BreweryService.js";
export default {
  name: "brewery-display",
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