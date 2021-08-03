<template>
  <div class="brewery">
    <h1>Brewery</h1>
    <brewery />
  </div>
</template>

<script>
import BreweryDisplay from "../components/BreweryDisplay.vue";

export default {
      name: "brewery",
  components: {
    BreweryDisplay
  }
};
</script>