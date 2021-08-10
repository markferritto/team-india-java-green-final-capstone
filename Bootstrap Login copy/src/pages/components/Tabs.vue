<template>
  <div class="section section-tabs">
    <div class="container">
      <div class="title">
      </div>
      <div class="row">
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
                  <p>{{ brewery.streetAddress }}, {{ brewery.city }}, {{ brewery.state }} {{ brewery.zip }}</p>
              </tab-pane>
            </tabs>
          </card>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { Card, Tabs, TabPane } from '@/components';
import breweryService from "../../services/BreweryService.js";

export default {
  components: {
    Card,
    Tabs,
    TabPane
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
    breweryService
      .retrieveBeersPerBrewery(this.$route.params.id)
      .then((response) => {
        this.beers = response.data;
      });
  },
};
</script>

<style>
.tab-content.tab-content-padding {
  padding: 20px;
}

h1 {
  font-size: 70px;
}
</style>
