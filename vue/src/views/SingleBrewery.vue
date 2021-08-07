<template>
  <div class="brewery">
    <!-- <h1>Brewery</h1> -->
    <breweryDisplay />
    <!-- <add-review/> -->
  </div>
</template>

<script>
// import AddReview from "../components/AddReview.vue";
import BreweryDisplay from "../components/BreweryDisplay.vue";

export default {
  name: "single-brewery",
  components: {
    BreweryDisplay,
    // AddReview,
  },
};
</script>