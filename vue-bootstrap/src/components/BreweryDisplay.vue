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

        <div class="col-md-10 ml-auto col-xl-6 mr-auto">
          <!-- Nav tabs -->
          <card>
            <tabs
              slot="raw-content"
              tab-content-classes="tab-content-padding text-center"
            >
              <tab-pane>
                <template slot="label">
                  <i class="now-ui-icons objects_umbrella-13"></i> About
                </template>
                <p>
                  {{ brewery.description }}
                </p>
              </tab-pane>
              <tab-pane>
                <template slot="label">
                  <i class="now-ui-icons shopping_shop"></i> Contact
                </template>
                <p>{{ brewery.websiteUrl }}</p>
                <p>{{ brewery.phoneNumber }}</p>
                <p>
                  {{ brewery.streetAddress }}, {{ brewery.city }},
                  {{ brewery.state }} {{ brewery.zip }}
                </p>
              </tab-pane>
            </tabs>
          </card>
        </div>
      </div>
    </div>

    <div class="container">
      <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
          <div class="page-section">
            <h1 class="page-title">Beer</h1>
          </div>
        </div>
      </div>
      <div class="row">
        <!-- Porter -->
        <div class="col-lg-12 col-md-4 col-sm-6 col-xs-12 mb40">
          <div
            class="menu-block"
            v-for="beerType in beers"
            v-bind:key="beerType.beerId"
          >
            <h3 class="menu-title" v-popover:popover1>
              {{ beerType.beerType }}
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

            <div v-for="beer in beers" v-bind:key="beer.beerId">
              <div
                class="row menu-content"
                v-if="beer.beerType == beerType.beerType"
              >
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                  <div class="dish-img">
                    <h5 class="dish-title">
                      <p>{{ beer.name }}</p>
                    </h5>
                  </div>
                </div>
                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                  <div class="dish-content">
                    <span class="dish-meta">{{ beer.description }}</span>
                    <div class="dish-price">
                      <p>{{ beer.abv }}</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /.porter -->
        <div class="row"></div>
      </div>
    </div>
  </div>
</template>

<script>
import breweryService from "../services/BreweryService.js";
import beerService from "../services/BeerService.js";
import { Card, Tabs, TabPane } from "@/components";
import { Popover } from "element-ui";

export default {
  name: "brewery-display",

  components: {
    Card,
    Tabs,
    TabPane,
    [Popover.name]: Popover,
  },

  data() {
    return {
      brewery: {},
      beers: [],
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
.dish-img {
}
.dish-content {
  margin-top: 12px;
  margin-bottom: 40px;
}
.dish-meta {
  font-size: 12px;
  text-transform: uppercase;
  display: block;
  width: 210px;
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
  position: absolute;
  right: 16px;
  top: 0px;
  font-size: 26px;
  color: #e03c23;
  font-weight: 500;
  font-family: "Zilla Slab", serif;
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

.page-title {
  background-color: grey;
  border-bottom-left-radius: 2em;
  border-bottom-right-radius: 2em;
}
</style>
