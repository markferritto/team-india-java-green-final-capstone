<template>
  <div class="brewery">
    HI!!!!
    <!-- <h1>Brewery</h1> -->
    <breweryDisplay />
  </div>
</template>

<script>
import BreweryDisplay from "../components/BreweryDisplay.vue";

export default {
  name: "single-brewery",
  bodyClass: "brewery",
  components: {
    BreweryDisplay
  }
  
};
</script>