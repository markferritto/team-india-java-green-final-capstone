<template>
  <div>
    <div class="page-header page-header-small">
      <parallax
        class="page-header-image"
        style="background-image: url('/img/bg12.jpg')"
      >
      </parallax>
      <div class="content-center">
        <div class="container">
          <h1 class="title">
            {{ brewery.name }}
          </h1>
          <div class="rounded-pill img-raised rating-section">            
            <i
              v-for="n in Math.round(brewery.rating)"
              v-bind:key="n.id"
              class="fa fa-star checked"
              ariahidden="true"
            ></i>
            <i
              v-for="n in 5 - Math.round(brewery.rating)"
              v-bind:key="n.id"
              class="fa fa-star"
              ariahidden="true"
            ></i>
          </div>
        </div>
      </div>
    </div>

    <div class="about-background">
      <div class="card card-block">
        <!-- Nav tabs -->
        <tabs
          slot="raw-content"
          tab-content-classes="tab-content-padding text-center"
        >
          <p class="brewery-description">{{ brewery.description }}</p>
          <p class="brewery-websiteUrl">
            <a href="#">{{ brewery.websiteUrl }}</a>
          </p>
          <p class="brewery-phoneNumber">{{ brewery.phoneNumber }}</p>
          <p class="brewery-address">
            {{ brewery.streetAddress }}, {{ brewery.city }},
            {{ brewery.state }}
            {{ brewery.zip }}
          </p>
        </tabs>
        <div class="map-responsive">
          <iframe
            src="https://www.google.com/maps/embed/v1/place?key=AIzaSyA0s1a7phLN0iaD6-UE7m4qP-z21pH0eSc&q=Columbs+Ohio"
            width="600"
            height="450"
            frameborder="0"
            style="border: 0"
            allowfullscreen
          ></iframe>
        </div>
      </div>
    </div>
    <header>
      <h1 class="beerFont">Beer</h1>
      <img
        src="https://assets.codepen.io/t-517/divider-triangle.png"
        class="divider"
      />
    </header>
    <div class="container">
      <div
        class="row"
        v-for="beerType in beerTypes"
        v-bind:key="beerType.beerId"
      >
        <div class="col-lg-12 col-md-4 col-sm-6 col-xs-12 mb40">
          <div class="menu-block">
            <h3 class="menu-title">
              {{ beerType }}
            </h3>
            <row>
              <div v-for="beer in beers" v-bind:key="beer.beerId">
                <div class="row menu-content" v-if="beer.beerType == beerType">
                  <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="dish-img">
                      <h5 class="dish-title">
                        <p>
                          {{ beer.name }}
                        </p>
                      </h5>
                    </div>
                  </div>
                  <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                    <div class="dish-content">
                      <span class="dish-meta"
                        >{{ beer.description }} - {{ beer.abv }}%</span
                      >
                      <div class="dish-price">
                        <p>
                          {{ beer.stars }}/5
                          <a v-on:click="sendToBeerReview(beer.beerId)" class="btn btn-reviews btn-sm">See/Add Reviews</a>
                          <n-button
                            class="btn btn-danger btn-sm"
                            v-if="$store.state.token != ''"
                            v-on:click="deleteBeer(beer.beerId).reload()"
                            >Delete Beer</n-button
                          >
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </row>
          </div>
        </div>
      </div>
    </div>

    <div class="container">
      <div>
        <n-button
          class="btn btn-round"
          v-on:click="showForm = !showForm"
          v-if="$store.state.token != ''"
          type="success"
        >
          Add a New Beer
        </n-button>

        <form v-show="showForm" v-on:submit.prevent="addingBeer().reload()">
          <div class="form-group">
            <label for="inputAddress">Beer Name</label>
            <input
              type="text"
              class="form-control"
              id="inputAddress"
              v-model="newBeer.name"
            />
          </div>
          <div class="form-group">
            <label for="inputAddress2">Description</label>
            <input
              type="text"
              class="form-control"
              id="inputAddress2"
              v-model="newBeer.description"
            />
          </div>
          <div class="form-group">
            <div class="form-group">
              <label for="inputAddress2">ABV</label>
              <input type="text" class="form-control" v-model="newBeer.abv" />
            </div>

            <div class="form-group">
              <label for="inputState">beerType</label>
              <select
                id="inputState"
                class="form-control"
                v-model="newBeer.beerType"
              >
                <option value="Pale Ale">Pale Ale</option>
                <option value="Lager">Lager</option>
                <option value="India Pale Ale">India Pale Ale</option>
                <option value="Stout">Stout</option>
                <option value="Pilsner">Pilsner</option>
                <option value="Porter">Porter</option>
              </select>
            </div>
          </div>
          <button type="submit" class="btn btn-primary">Save Beer</button>
        </form>
      </div>
    </div>
    <div class="col-lg-8 mx-auto">
      <div class="mb-4">
        <hr class="solid" />
      </div>
    </div>
  </div>
</template>

<script>
import breweryService from "../services/BreweryService.js";
import beerService from "../services/BeerService.js";
import { Tabs, Button } from "@/components";

export default {
  name: "brewery-display",

  components: {
    Tabs,
    [Button.name]: Button,
  },

  data() {
    return {
      brewery: {},
      beers: [],
      beerTypes: [],
      isLoading: true,
      showForm: false,
      newBeer: {},
    };
  },
  created() {
    breweryService.get(this.$route.params.id).then((response) => {
      this.brewery = response.data;
    });
    beerService
      .retrieveBeersPerBrewery(this.$route.params.id)
      .then((response) => {
        this.beers = response.data;
        this.isLoading = false;
      });
    beerService
      .retrieveBeerTypesPerBrewery(this.$route.params.id)
      .then((response) => {
        this.beerTypes = response.data;
        this.isLoading = false;
      });
  },
  methods: {
    sendToBeerReview(beerId) {
      this.$router.push(`/reviews/beer/${beerId}`);
    },
    deleteBeer(beerId) {
      beerService.deleteBeer(beerId);
      window.location.reload(true);
    },
    addingBeer() {
      beerService
        .addBeer(this.newBeer, this.$route.params.id)
        .then((response) => {
          if (response.status === 201) {
            this.showForm = false;
            this.newBeer = {};
            window.location.reload(true);
          }
        });
    },
  },
};
</script>

<style scoped>
.beerFont {
  color: black;
  font-family: "Franklin Gothic", serif;
  font-size: 75px;
  font-weight: normal;
  line-height: 48px;
  margin: 0;
}

p {
  color: black;
  font-weight: bold;
  font-family: "Tahoma", "Courier New", monospace;
}

.brewery-description {
  font-size: 35px;
}

.brewery-websiteUrl {
  color: #4fb4d0;
  font-size: 20px;
  display: inline;
}

.brewery-phoneNumber {
  margin-top: 15px;
}

.brewery-address {
  margin-top: 0px;
}

.menu-block {
  margin-bottom: 30px;
}
.menu-title {
  border-bottom: 3px solid #e0e6e3;
  margin-bottom: 36px;
  padding-bottom: 10px;
  text-align: center;
}
.menu-content {
  border-bottom: 1px solid #e0e6e3;
  margin-bottom: 30px;
}

.dish-content {
  margin-top: 12px;
  margin-bottom: 40px;
}
.dish-meta {
  line-height: 1.7;
  font-size: 18px;
  text-transform: uppercase;
  display: block;
  width: auto;
}
.dish-title {
  margin-top: 12px;
  margin-bottom: 40px;
}
.dish-price {
  display: block;
  width: auto;
  line-height: 1.7;
  position: absolute;
  right: 16px;
  top: 0px;
  font-size: 26px;
  color: #e03c23;
  font-weight: 500;
}
.well-block .dish-meta {
  width: 100%;
}
.well-block .dish-price {
  font-size: 26px;
  color: #e03c23;
  font-weight: 500;
  font-family: "Zilla Slab", serif;
  position: inherit;
}

header {
  position: relative;
  height: 250px;
  background-image: linear-gradient(rgb(231, 157, 83), rgb(204, 153, 0));
}

h1 {
  margin: 0;
  padding: 50px 0;
  text-align: center;
}

header h1 {
  color: white;
}

.divider {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  width: 100%;
  height: 100px;
  /* drop the height to have a constant angle for all screen widths */
}

.about-background {
  background-color: rgb(231, 157, 83);
  display: block;
}

.btn save {
  align-content: center;
}
.btn-round {
  background-color: #0ca85f;
}
.btn-sm {
  background-color: #b44f15;
}

.btn-reviews {
  background-color:rgb(231, 157, 83);
}

table {
  margin: 0 auto;
  text-align: center;
  border-collapse: collapse;
  border: 1px solid #d4d4d4;
  font-size: 20px;
  background: #fff;
}

table th,
table tr:nth-child(2n + 2) {
  background: #e7e7e7;
}

table th,
table td {
  padding: 20px 50px;
}

table th {
  border-bottom: 1px solid #d4d4d4;
}
.stars-outer {
  display: inline-block;
  position: relative;
  font-family: FontAwesome;
}

.stars-outer::before {
  content: "\f006 \f006 \f006 \f006 \f006";
}

.stars-inner {
  position: absolute;
  top: 0;
  left: 0;
  white-space: nowrap;
  overflow: hidden;
  width: 0;
}

.stars-inner::before {
  content: "\f005 \f005 \f005 \f005 \f005";
  color: #f8ce0b;
}

.fa {
  font-size: 84px;
  color: black;
}

.checked {
  color: rgb(231, 157, 83);
}

.rating-section {
  background-color: rgb(240, 230, 230);
  padding-top: 10px;
  padding-bottom: 10px;
  margin-right: 180px;
  margin-left: 180px;
}

.wrapper2 {
  padding-bottom: 90px;
}

.divider2 {
  position: relative;
  margin-top: 90px;
  height: 1px;
}

.div-transparent:before {
  content: "";
  position: absolute;
  top: 0;
  left: 5%;
  right: 5%;
  width: 90%;
  height: 1px;
  background-image: linear-gradient(
    to right,
    transparent,
    rgb(48, 49, 51),
    transparent
  );
}

.div-arrow-down:after {
  content: "";
  position: absolute;
  z-index: 1;
  top: -7px;
  left: calc(50% - 7px);
  width: 14px;
  height: 14px;
  transform: rotate(45deg);
  background-color: white;
  border-bottom: 1px solid rgb(48, 49, 51);
  border-right: 1px solid rgb(48, 49, 51);
}

.div-tab-down:after {
  content: "";
  position: absolute;
  z-index: 1;
  top: 0;
  left: calc(50% - 10px);
  width: 20px;
  height: 14px;
  background-color: white;
  border-bottom: 1px solid rgb(48, 49, 51);
  border-left: 1px solid rgb(48, 49, 51);
  border-right: 1px solid rgb(48, 49, 51);
  border-radius: 0 0 8px 8px;
}

.div-stopper:after {
  content: "";
  position: absolute;
  z-index: 1;
  top: -6px;
  left: calc(50% - 7px);
  width: 14px;
  height: 12px;
  background-color: white;
  border-left: 1px solid rgb(48, 49, 51);
  border-right: 1px solid rgb(48, 49, 51);
}

.div-dot:after {
  content: "";
  position: absolute;
  z-index: 1;
  top: -9px;
  left: calc(50% - 9px);
  width: 18px;
  height: 18px;
  background-color: goldenrod;
  border: 1px solid rgb(48, 49, 51);
  border-radius: 50%;
  box-shadow: inset 0 0 0 2px white, 0 0 0 4px white;
}

.map-responsive {
  overflow: hidden;
  padding-bottom: 400px;

  position: relative;
  height: 0;
}
.map-responsive iframe {
  left: 0;
  top: 0;
  height: 400px;
  width: 100%;
  position: absolute;
}

/*
*
* ==========================================
* CUSTOM UTIL CLASSES
* ==========================================
*
*/

hr.solid {
  border-top: 1px solid #999;
}
</style>
