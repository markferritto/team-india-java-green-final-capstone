<template>
  <v-app>
    <the-header />
    <v-main>
      <router-view />
    </v-main>
    <the-footer />
  </v-app>
</template>

<script>
import TheFooter from './components/TheFooter.vue';
import TheHeader from "./components/TheHeader.vue";

export default {
  components: { TheHeader, TheFooter },
  name: "App",
  data: () => ({
    //
  }),
};
</script>

<style scoped>
</style>