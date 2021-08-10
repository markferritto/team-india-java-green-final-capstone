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
          <h1 class="title">{{ brewery.name }}</h1>
        </div>
      </div>
    </div>

    <div class="about-background">
      <!-- Nav tabs -->
      <tabs
        slot="raw-content"
        tab-content-classes="tab-content-padding text-center"
      >
        <tab-pane>
          <template slot="label" class="button">
            <i class="now-ui-icons objects_umbrella-13"></i> About
          </template>
          <p>
            {{ brewery.description }}
          </p>
          <p>{{ brewery.websiteUrl }}</p>
          <p>{{ brewery.phoneNumber }}</p>
          <p>
            {{ brewery.streetAddress }}, {{ brewery.city }},
            {{ brewery.state }} {{ brewery.zip }}
          </p>
        </tab-pane>
        <tab-pane>
          <template slot="label" class="button">
            <i class="now-ui-icons shopping_shop"></i> Directions
          </template>
          <p>Map to be implemented.</p>
        </tab-pane>
      </tabs>
    </div>

    <header>
      <h1>Beer</h1>
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
            <h3 class="menu-title" v-popover:popover1>
              {{ beerType }}
            </h3>
            <el-popover
              ref="popover1"
              popper-class="popover"
              placement="top"
              width="200"
              trigger="hover"
            >
              <div class="popover-body">This beer is amazing</div>
            </el-popover>
            <row>
              <div
                v-for="beer in beers"
                v-on:click="sendToBeerReview(beer.beerId)"
                v-bind:key="beer.beerId"
              >
                <div class="row menu-content" v-if="beer.beerType == beerType">
                  <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="dish-img">
                      <h5 class="dish-title">
                        <p>{{ beer.name }}</p>
                      </h5>
                    </div>
                  </div>
                  <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                    <div class="dish-content">
                      <span class="dish-meta"
                        >{{ beer.description }} - {{ beer.abv }}</span
                      >
                      <div class="dish-price">
                        <p>{{ beer.stars }}/5 <n-button type="danger">Delete Beer</n-button></p>
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
  </div>
</template>

<script>
import breweryService from "../services/BreweryService.js";
import beerService from "../services/BeerService.js";
import { Tabs, TabPane, Button } from "@/components";
import { Popover } from "element-ui";

export default {
  name: "brewery-display",

  components: {
    Tabs,
    TabPane,
    [Popover.name]: Popover,
    [Button.name]: Button,
  },

  data() {
    return {
      brewery: {},
      beers: [],
      beerTypes: [],
      isLoading: true,
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
  },
};
</script>

<style scoped>
h1 {
  font-size: 70px;
}

p {
  color: black;
  font-weight: bold;
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
  font-size: 18px;
  text-transform: uppercase;
  display: block;
  width: auto;
  line-height: 1.7;
}
.dish-title {
  margin-bottom: 6px;
  font-size: 15px;
  text-transform: uppercase;
  font-weight: 500;
  position: relative;
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
}
</style>
