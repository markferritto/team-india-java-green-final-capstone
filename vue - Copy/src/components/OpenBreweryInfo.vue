<template>
  <v-container>
    <v-layout align-center justify-center row fill-height class="mt-5">
      <v-row dense align="stretch">
        <v-col
          v-for="brewery in openBreweries"
          v-on:click="sendToBrewery(brewery.website_url)"
          v-bind:key="brewery.breweryId"
        >
          <v-card :loading="loading" class="mx-auto my-12" max-width="374">
            <template slot="progress">
              <v-progress-linear
                color="deep-purple"
                height="10"
                indeterminate
              ></v-progress-linear>
            </template>

            <v-img height="250" src="../../pictures/brewery.jpg"></v-img>

            <v-card-title>{{ brewery.name }}</v-card-title>

            <v-card-text>
              <v-row align="center" class="mx-0">
                <v-rating
                  :value="5"
                  color="amber"
                  dense
                  half-increments
                  readonly
                  size="14"
                ></v-rating>

                <div class="grey--text ms-4">5</div>
              </v-row>

              <div class="my-4 text-subtitle-1">
                {{ brewery.brewery_type }}
              </div>

              <div class="my-4 text-subtitle-2">
                {{ brewery.street }}. {{ brewery.city }}, {{ brewery.state }}
                {{ brewery.postal_code }}
              </div>

              <div><a href=""> {{ brewery.website_url }} </a></div>
            </v-card-text>

            <v-divider class="mx-4"></v-divider>
          </v-card>
        </v-col>
      </v-row>
    </v-layout>
  </v-container>
</template>

<script>
export default {
  name: "open-brewery-search",

  data() {
    return {
      openBreweries: [],
    };
  },
  created() {
    fetch(
      "https://api.openbrewerydb.org/breweries?by_state=ohio&by_city=columbus&per_page=50"
    )
      .then((response) => {
        if (response.status !== 200) {
          console.log(
            "Looks like there was a problem. Status Code: " + response.status
          );
          return;
        }

        // Examine the text in the response
        response.json().then((data) => {
          this.brewery = data;
          this.breweryList = JSON.parse(JSON.stringify(data));
          this.breweryList.forEach((brewery) => {
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
      })
      // [{"id":8234,"obdb_id":"actual-brewing-company-llc-columbus","name":"Actual Brewing Company, LLC","brewery_type":"micro","street":"655 N James Rd",
      // "address_2":null,"address_3":null,"city":"Columbus","state":"Ohio","county_province":null,"postal_code":"43219-1837","country":"United States","longitude":"-82.9080986","latitude":"39.9868523",
      // "phone":"6146363825","website_url":"http://wwww.actualbeer.com","updated_at":"2018-07-24T00:00:00.000Z","created_at":"2018-07-24T00:00:00.000Z"},
      .catch((err) => {
        console.log("Fetch Error", err);
      });
  },
  methods: {
    sendToBrewery(website_url) {
      this.$router.push(`${website_url}`);
    },
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