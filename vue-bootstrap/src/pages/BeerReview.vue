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
#search-box {
  padding-top: 12vh;
  padding-bottom: 10px;
  max-height: 220px;
}
</style>

