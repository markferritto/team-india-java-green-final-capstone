<template>
  <div
    class="brewery"
    
    v-bind:key="brewery.id"
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
  // prop: ['breweries'],
  data() {
    return {
      brewery: {},
      isLoading: true,
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