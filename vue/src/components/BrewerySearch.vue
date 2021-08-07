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



    <label for = "zip">Enter brewery name</label>
        <input type="text" v-model="breweryFilter.name"/>
         <label for = "zip">Enter  brewery city</label>
        <input type="text" v-model="breweryFilter.city"/>
    <tbody>

      
        
      <tr v-for="brewery in fiteringBrew"  v-on:click="sendToBrewery(brewery.breweryId)" v-bind:key="brewery.breweryId">
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
import breweryService from "../services/BreweryService.js";

export default {
  name: "brewery-search",
  data() {
    return {
     breweryFilter:{
        breweryId:"",
        name: "",
        rating: "",
        description: "",
        typeName: "",
        websiteUrl: "",
        phoneNumber: "",
        streetAddress: "",
        city: "",
        state: "",
        zip: "",
     },








      // breweryFilter: "",
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

  fiteringBrew(){
    return this.breweries.filter((brewery)=>{
      return brewery.name.toLowerCase().includes(this.breweryFilter.name.toLowerCase())  &&  brewery.city.toLowerCase().includes(this.breweryFilter.city.toLowerCase())  ;
    })

  }
  },


  methods: {
    sendToBrewery(breweryId) {
      this.$router.push(`/brewery/${breweryId}`);
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
