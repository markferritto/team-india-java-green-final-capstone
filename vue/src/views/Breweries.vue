<template>
  <div class="breweries">
    <h1>Breweries</h1>
    <brewery-list />
  </div>
</template>

<script>
import BreweryList from "../components/BreweryList.vue";

export default {
  components: {
    BreweryList
  }
};
</script>