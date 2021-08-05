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

};
</script>

<style scoped>
h1 {
  font-size: 70px;
}
</style>