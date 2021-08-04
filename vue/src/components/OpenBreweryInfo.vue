<template>
    <table class="cinereousTable">
    <thead>
      <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Address</th>
        <th>Website</th>
        <th>Average Rating of Beers</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="brewery in openBreweries" v-on:click="sendToBrewery(brewery.websiteUrl)" v-bind:key="brewery.breweryId">
        <td>{{ brewery.name }}</td>
        <td>{{ brewery.typeName }}: {{ brewery.description }}</td>
        <td>{{ brewery.streetAddress }}. {{ brewery.city }}, {{ brewery.state }} {{ brewery.zip }} </td>
        <td>{{ brewery.websiteUrl }}</td>
        <td>{{ brewery.rating }}</td>
      </tr>
    </tbody>
  </table>
</template>

<script>


export default {
  name: "open-brewery",

  data() {
    return {
      openBreweries: []
    };
  },
  created() {

fetch('https://api.openbrewerydb.org/breweries?by_state=ohio&per_page=50')
  .then((response) => {
      if (response.status !== 200) {
        console.log('Looks like there was a problem. Status Code: ' +
          response.status);
        return;
      }

      // Examine the text in the response
      response.json().then((data) => {
        console.log(data);
        this.brewery = data;
        breweryList = JSON.Parse(data);
        breweryList.forEach(brewery => {
        breweryId = brewery.id;
        name = brewery.name;
        typeName = brewery.brewery_type;
        streetAddress = brewery.street;
        city = brewery.city;
        state = brewery.state;
        zip = brewery.zip;
        websiteUrl = brewery.website_url;
        this.openBreweries.push(brewery);
        });
      });
    }
  )
// [{"id":14417,"obdb_id":"snow-belt-brew-chardon","name":"Snow Belt Brew","brewery_type":"micro","street":"9511 Kile Rd","address_2":null,
// "address_3":null,"city":"Chardon","state":"Ohio","county_province":null,"postal_code":"44024","country":"United States",
// "longitude":null,"latitude":null,"phone":null,"website_url":null,"updated_at":"2018-07-24T00:00:00.000Z","created_at":"2018-07-24T00:00:00.000Z"}
  .catch((err) => {
    console.log('Fetch Error', err);
  });
  },
  methods: {
    sendToBrewery(websiteUrl) {
      this.$router.push(`/brewery/${websiteUrl}`);
    }
  },
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