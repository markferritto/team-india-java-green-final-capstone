<template>
  <div>
    <div
      class="page-header page-header-extra-small p-5 text-center bg-dark"
      filter-color="brown"
    >
      <div id="search-box" class="container">
        <h1 class="title">Find a Brewery</h1>
        <div class="form-group">
          <label for="exampleDropdownFormEmail1"></label>
          <table class="container">
            <tr>
              <td><input 
                class="form-control"
                placeholder="Name"
              /></td>
              <td><input
                class="form-control"
                placeholder="City"
              /></td>
            </tr>
          </table>
        </div>
      </div>
    </div>
    <div class="main">
      <brewery-search />
    </div>
  </div>
</template>

<script>
import BrewerySearch from "../components/BrewerySearch.vue";
export default {
  components: { BrewerySearch },
  name: "breweries",
  bodyClass: "index-page",
};
</script>

<style scoped>

#search-box{
    padding-top: 12vh;
    padding-bottom: 10px;
    max-height: 220px;
}

</style>

