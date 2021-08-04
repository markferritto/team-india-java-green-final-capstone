<template>
  <v-container>
    <v-layout align-center justify-center row fill-height class="mt-5">
      <v-row dense align="stretch">
        <v-col
          cols="3"
          v-for="brewery in filteredBreweries"
          v-on:click="sendToBrewery(brewery.breweryId)"
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
                  :value="brewery.rating"
                  color="amber"
                  dense
                  half-increments
                  readonly
                  size="14"
                ></v-rating>

                <div class="grey--text ms-4">
                  {{ brewery.rating }}
                </div>
              </v-row>

              <div class="my-4 text-subtitle-1">
                {{ brewery.typeName }}
              </div>

              <div class="my-4 text-subtitle-2">
                {{ brewery.streetAddress }}. {{ brewery.city }},
                {{ brewery.state }} {{ brewery.zip }}
              </div>

              <div>{{ brewery.description }}</div>
            </v-card-text>

            <v-divider class="mx-4"></v-divider>
          </v-card>
        </v-col>
      </v-row>
    </v-layout>
  </v-container>
</template>

<script>
import breweryService from "../services/BreweryService.js";

export default {
  name: "brewery-search",
  data() {
    return {
      breweryFilter: "",
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
  },
  methods: {
    sendToBrewery(breweryId) {
      this.$router.push(`/brewery/${breweryId}`);
    },
  },
  created() {
    breweryService.retrieve().then((response) => {
      this.breweries = response.data;
      this.isLoading = false;
    });
  },
};
</script>

<style scoped>
</style>
