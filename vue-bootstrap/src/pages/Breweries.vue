<template>
  <div>
         <brewery-search />
  </div>
</template>

<script>
import BrewerySearch from "../components/BrewerySearch.vue";
export default {
  components: { BrewerySearch },
  name: "breweries",
  bodyClass: "breweries",
};
</script>

<style scoped>

#search-box{
    padding-top: 12vh;
    padding-bottom: 10px;
    max-height: 220px;
}

</style>

