<template>
  <div>
    <h2>Brewery:</h2>
    <p>{{ brewery }}</p>
    <div>

    </div>
  </div>
</template>

<script>


export default {
  name: "open-brewery",

  data() {
    return {
      brewery: ''
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
        });
      });
    }
  )
  //[{"id":14417,"obdb_id":"snow-belt-brew-chardon","name":"Snow Belt Brew","brewery_type":"micro","street":"9511 Kile Rd",
  //"address_2":null,"address_3":null,"city":"Chardon","state":"Ohio","county_province":null,"postal_code":"44024","country":"United States",
  //"longitude":null,"latitude":null,"phone":null,"website_url":null,"updated_at":"2018-07-24T00:00:00.000Z","created_at":"2018-07-24T00:00:00.000Z"}

  .catch((err) => {
    console.log('Fetch Error', err);
  });
  },
};
</script>

<style>
</style>