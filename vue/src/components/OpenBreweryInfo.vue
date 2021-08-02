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
      });
    }
  )
  .catch((err) => {
    console.log('Fetch Error', err);
  });
  },
};
</script>

<style>
</style>