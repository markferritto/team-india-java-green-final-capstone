<template>
  <v-app>
    <div>
      <router-link tag='hi' v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'breweries' }">Breweries</router-link> |&nbsp;
      <router-link v-bind:to="{ name: 'open-brewery' }">OpenBrewery</router-link>
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
      </div>
    <v-main>
      <router-view/>
    </v-main>
  </v-app>
</template>

<script>

export default {
  name: 'App',

  data: () => ({
    //
  }),
};
</script>

<style scoped>
</style>