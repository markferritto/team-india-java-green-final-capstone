<template>
  <table class="cinereousTable">
    <thead>
      <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Address</th>
        <th>Brewers</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="brewery in filteredBreweries" v-on:click="sendToBrewery(id)" v-bind:key="brewery.brewery_id">
        <!-- <router-link v-bind:to="{ name: 'single-brewery', params: { id: brewery.id } }">{{ brewery.name }}</router-link> -->
        <td>{{ brewery.name }}</td>
        <td>{{ brewery.description }}</td>
        <td>{{ brewery.website_url }}</td>
        <td>{{ brewery.state }}</td>
      </tr>
    </tbody>
  </table>
</template>

<script>
import breweryService from "../services/BreweryService.js";

export default {
  name: "brewery-search",
  data() {
    return {
      breweryFilter: "",
      breweries: [],
      isLoading: true,
    };
  },
  computed: {
    filteredBreweries() {
      return this.breweries.filter((brewery) => {
        return this.breweryFilter == ""
          ? true
          : this.breweryFilter == brewery.name;
      });
    },
  },
  methods: {
    sendToBrewery(id) {
      this.$router.push(`/brewery/${id}`);
    }
  },
  created() {
      breweryService.retrieve().then(response => {
        this.breweries = response.data;
        this.isLoading = false;
      })
    }

};
</script>

<style scoped>
table.cinereousTable {
  border: 6px solid #948473;
  background-color: #ffe3c6;
  width: 100%;
  text-align: center;
}
table.cinereousTable td,
table.cinereousTable th {
  border: 1px solid #948473;
  padding: 4px 4px;
}
table.cinereousTable tbody td {
  font-size: 13px;
}
table.cinereousTable thead {
  background: #948473;
  background: -moz-linear-gradient(top, #afa396 0%, #9e9081 66%, #948473 100%);
  background: -webkit-linear-gradient(
    top,
    #afa396 0%,
    #9e9081 66%,
    #948473 100%
  );
  background: linear-gradient(to bottom, #afa396 0%, #9e9081 66%, #948473 100%);
}
table.cinereousTable thead th {
  font-size: 17px;
  font-weight: bold;
  color: #f0f0f0;
  text-align: left;
  border-left: 2px solid #948473;
}
table.cinereousTable thead th:first-child {
  border-left: none;
}

table.cinereousTable tfoot td {
  font-size: 16px;
}

</style>
