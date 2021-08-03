<template>
  <div class="breweries">
    <h1>Breweries</h1>
    <brewery-search />
  </div>
</template>

<script>
import BrewerySearch from "../components/BrewerySearch.vue";

export default {
      name: "breweries",
  components: {
    BrewerySearch
  }
};
</script>