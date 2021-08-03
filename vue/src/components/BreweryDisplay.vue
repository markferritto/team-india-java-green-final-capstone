<template>
  <div class="brewery" v-bind:key="brewery.id">
    <h1>{{ brewery.name }}</h1>
    <h3>{{ brewery.description }}</h3>
    <p>{{ brewery.address }}</p>
    <p>{{ brewery.brewers }}</p>
  </div>
</template>

<script>
// import breweryService from "../services/BreweryService.js";
export default {
  name: "brewery-display",
  props: ["brewery"],
  methods: {

  }
};
</script>

<style>

</style>