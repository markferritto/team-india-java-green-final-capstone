<template>
  <div>
    <add-beer-rating />
  </div>
</template>

<script>
import AddBeerRating from "../components/AddBeerRating.vue";

export default {
  components: { AddBeerRating },
  name: "breweries",
  bodyClass: "breweries",
};
</script>

<style scoped>
</style>

