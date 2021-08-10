<template>
  <div>
    <add-beer-rating />
  </div>
</template>

<script>
import AddBeerRating from "../components/AddBeerRating.vue"

export default {
  components: AddBeerRating,
  name: "beer-review",
  bodyClass: "beer-review",
};
</script>

<style scoped>
</style>

