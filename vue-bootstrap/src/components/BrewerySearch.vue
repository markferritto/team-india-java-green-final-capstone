<template>
  <div>
    <div class="p-5 text-center bg-dark" >
      <div id="search-box" class="container">
        <h1 class="title">Find a Brewery</h1>
        <div class="form-group">
          <label for="exampleDropdownFormEmail1"></label>
          <table class="container">
            <tr>
              <td>
                <input
                  class="form-control search-button"
                  v-model="breweryFilter.name"
                  placeholder="Name"
                />
              </td>
              <td>
                <select
                  required
                  class="form-control search-button"
                  v-model="breweryFilter.brewery_type"
                >
                  <option class="search-button" value="">
                    Select Brewery Type
                  </option>
                  <option value="micro">Microbrewery</option>
                  <option value="brew pub">Brew Pub</option>
                  <option value="tap">Taproom</option>
                  <option value="reg">Regional</option>
                  <option value="con">Contract</option>
                  <option value="alt">Alternating Proprietor</option>
                </select>
              </td>
            </tr>
          </table>
        </div>
      </div>
    </div>
    <div class="main">
      <!-- Topic Cards -->
      <div id="cards_landscape_wrap-2">
        <div class="container">
          <div class="row">
            <div
              class="col-xs-12 col-sm-6 col-md-3 col-lg-3"
              v-for="brewery in fiteringBrew"
              v-on:click="sendToBrewery(brewery.breweryId)"
              v-bind:key="brewery.breweryId"
            >
              <a href="">
                <div class="card-flyer">
                  <div class="text-box">
                    <div class="image-box">
                      <img :src="randomItem(images)" alt="" />
                    </div>
                    <div class="text-container">
                      <h6>{{ brewery.name }}<p>{{ brewery.brewery_type }}</p></h6>
                      <h5>
                        {{ brewery.description }}
                      </h5>
                      <p>
                        {{ brewery.streetAddress }}{{ brewery.street}}, {{ brewery.city }} {{ brewery.state}} {{ brewery.zip }}
                      </p>
                    </div>
                  </div>
                </div>
              </a>
            </div>

            <div
              class="col-xs-12 col-sm-6 col-md-3 col-lg-3"
              v-for="brewery in openBreweries"
              v-on:click="sendToOpenBrewery(brewery.breweryId)"
              v-bind:key="brewery.breweryId"
            >
              <a href="">
                <div class="card-flyer">
                  <div class="text-box">
                    <div class="image-box">
                      <img src="/img/bg1.jpg" alt="" />
                    </div>
                    <div class="text-container">
                      <h6>{{ brewery.name }}</h6>
                      <p>
                        {{ brewery.description }}
                      </p>
                    </div>
                  </div>
                </div>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import breweryService from "../services/BreweryService.js";

export default {
  name: "brewery-search",
  data() {
    return {
      // breweryFilter: "",
      breweryFilter: {
        breweryId: "",
        name: "",
        rating: "",
        description: "",
        brewery_type: "",
        websiteUrl: "",
        phoneNumber: "",
        streetAddress: "",
        city: "",
        state: "",
        zip: "",
      },
      breweries: [],
      isLoading: true,
      openBreweries: [],
      images: [
        "/img/brewerypic1.jpeg",
        "/img/brewerypic2.jpeg",
        "/img/brewerypic3.jpeg",
        "/img/brewerypic4.jpeg",
        "/img/brewerypic5.jpeg",
        "/img/brewerypic6.jpeg",
        "/img/brewerypic7.jpeg",
        "/img/brewerypic8.jpeg",
        "/img/brewerypic9.jpeg",
      ],
      selectedImage: null,
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
    fiteringBrew() {
      return this.breweries.filter((brewery) => {
        let nameMatch = brewery.name
          .toLowerCase()
          .includes(this.breweryFilter.name.toLowerCase());
        let typematch = brewery.brewery_type
          .toLowerCase()
          .includes(this.breweryFilter.brewery_type.toLowerCase());
        if (
          (!this.breweryFilter.name || nameMatch) &&
          (!this.breweryFilter.brewery_type || typematch)
        ) {
          return brewery;
        }
      });
    },
  },
  methods: {
    sendToBrewery(breweryId) {
      this.$router.push(`/breweries/${breweryId}`);
    },
    sendToOpenBrewery(website_url) {
      this.$router.push(`${website_url}`);
    },
    randomItem(items) {
      return items[Math.floor(Math.random() * items.length)];
    },
  },
  created() {
    breweryService.retrieve().then((response) => {
      this.breweries = response.data;
      this.isLoading = false;
    });
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
            this.breweries.push(brewery);
          });
        });
      })
      .catch((err) => {
        console.log("Fetch Error", err);
      });
  },
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css?family=Open+Sans&display=swap");

.ratings {
  background-color: #fff;
  padding: 54px;
  border: 1px solid rgba(0, 0, 0, 0.1);
  box-shadow: 0px 10px 10px #e0e0e0;
}

.product-rating {
  font-size: 50px;
}

.stars i {
  font-size: 18px;
  color: #28a745;
}

.rating-text {
  margin-top: 10px;
}

.title {
  color: white;
}

/*----  Main Style  ----*/
#cards_landscape_wrap-2 {
  text-align: center;
  background: #f7f7f7;
}
#cards_landscape_wrap-2 .container {
  padding-top: 20px;
  padding-bottom: 700px;
}
#cards_landscape_wrap-2 a {
  text-decoration: none;
  outline: none;
}
#cards_landscape_wrap-2 .card-flyer {
  border-radius: 5px;
}
#cards_landscape_wrap-2 .card-flyer .image-box {
  background: #ffffff;
  overflow: hidden;
  box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.5);
  border-radius: px;
}
#cards_landscape_wrap-2 .card-flyer .image-box img {
  -webkit-transition: all 0.9s ease;
  -moz-transition: all 0.9s ease;
  -o-transition: all 0.9s ease;
  -ms-transition: all 0.9s ease;
  width: 100%;
  height: 200px;
}
#cards_landscape_wrap-2 .card-flyer:hover .image-box img {
  opacity: 0.7;
  -webkit-transform: scale(1.15);
  -moz-transform: scale(1.15);
  -ms-transform: scale(1.15);
  -o-transform: scale(1.15);
  transform: scale(1.15);
}
#cards_landscape_wrap-2 .card-flyer .text-box {
  text-align: center;
}
#cards_landscape_wrap-2 .card-flyer .text-box .text-container {
  padding: 30px 18px;
}
#cards_landscape_wrap-2 .card-flyer {
  background: #ffffff;
  margin-top: 50px;
  -webkit-transition: all 0.2s ease-in;
  -moz-transition: all 0.2s ease-in;
  -ms-transition: all 0.2s ease-in;
  -o-transition: all 0.2s ease-in;
  transition: all 0.2s ease-in;
  box-shadow: 0px 3px 4px rgba(0, 0, 0, 0.4);
}
#cards_landscape_wrap-2 .card-flyer:hover {
  background: #fff;
  box-shadow: 0px 15px 26px rgba(0, 0, 0, 0.5);
  -webkit-transition: all 0.2s ease-in;
  -moz-transition: all 0.2s ease-in;
  -ms-transition: all 0.2s ease-in;
  -o-transition: all 0.2s ease-in;
  transition: all 0.2s ease-in;
  margin-top: 50px;
}
#cards_landscape_wrap-2 .card-flyer .text-box p {
  margin-top: 10px;
  margin-bottom: 0px;
  padding-bottom: 0px;
  font-size: 14px;
  letter-spacing: 1px;
  color: #000000;
}
#cards_landscape_wrap-2 .card-flyer .text-box h6 {
  margin-top: 0px;
  margin-bottom: 4px;
  font-size: 18px;
  font-weight: bold;
  text-transform: uppercase;
  font-family: "Roboto Black", sans-serif;
  letter-spacing: 1px;
  color: #00acc1;
}

.text-container {
  height: 260px;
}

.main {
  background: grey;
}

h5 {
  
  color: black;
}

.search-button {
  background-color: white;
}

p {

  color: black;
  font-weight: bold;
}
</style>