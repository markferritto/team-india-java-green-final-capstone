<template>
    <table class="cinereousTable">
    <thead>
      <tr>
        <th>Name</th>
        <th>Brewery Type</th>
        <th>Address</th>
        <th>Website</th>
        <th>Phone Number</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="brewery in openBreweries" v-on:click="sendToBrewery(brewery.website_url)" v-bind:key="brewery.breweryId">
        <td>{{ brewery.name }}</td>
        <td>{{ brewery.brewery_type }} {{ brewery.description }}</td>
        <td>{{ brewery.street }}. {{ brewery.city }}, {{ brewery.state }} {{ brewery.postal_code }} </td>
        <td>{{ brewery.website_url }}</td>
        <td>{{ brewery.phone }}</td>
      </tr>
    </tbody>
  </table>
</template>

<script>

export default {
  name: "open-brewery-search",

  data() {
    return {
      openBreweries: []
    };
  },
  created() {

fetch('https://api.openbrewerydb.org/breweries?by_state=ohio&by_city=columbus&per_page=50')
  .then((response) => {
      if (response.status !== 200) {
        console.log('Looks like there was a problem. Status Code: ' +
          response.status);
        return;
      }

      // Examine the text in the response
      response.json().then((data) => {
        this.brewery = data;
        this.breweryList = JSON.parse(JSON.stringify(data));
        this.breweryList.forEach(brewery => {
        this.breweryId = brewery.id;
        this.name = brewery.name;
        this.typeName = brewery.brewery_type;
        this.streetAddress = brewery.street;
        this.city = brewery.city;
        this.state = brewery.state;
        this.zip = brewery.zip;
        this.websiteUrl = brewery.website_url;
        this.openBreweries.push(brewery);
        });
      });
    }
  )
// [{"id":8234,"obdb_id":"actual-brewing-company-llc-columbus","name":"Actual Brewing Company, LLC","brewery_type":"micro","street":"655 N James Rd",
// "address_2":null,"address_3":null,"city":"Columbus","state":"Ohio","county_province":null,"postal_code":"43219-1837","country":"United States","longitude":"-82.9080986","latitude":"39.9868523",
// "phone":"6146363825","website_url":"http://wwww.actualbeer.com","updated_at":"2018-07-24T00:00:00.000Z","created_at":"2018-07-24T00:00:00.000Z"},
  .catch((err) => {
    console.log('Fetch Error', err);
  });
  },
  methods: {
    sendToBrewery(website_url) {
      this.$router.push(`${website_url}`);
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