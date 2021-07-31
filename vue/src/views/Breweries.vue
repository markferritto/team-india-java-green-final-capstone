<template>
  <div class="breweries">
    <h1>Breweries</h1>
    <brewery-list />
  </div>
</template>

<script>
import BreweryList from "@/components/BreweryList";

export default {
  components: {
    BreweryList
  }
};
</script>