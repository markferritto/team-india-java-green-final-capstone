<template>
  <div
    class="brewery"
    v-bind:class="{ brewery: breweries.brewery }"
    v-bind:key="brewery.id"
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
        name: '',
        description: '',
        address: '',
        beers: '',
      },
      isLoading: true,
    };
  },
  created() {
      breweryService.retrieve().then(response => {
        this.brewery = response.data;
        this.isLoading = false;
      })
    }
};
</script>

<style>
</style>