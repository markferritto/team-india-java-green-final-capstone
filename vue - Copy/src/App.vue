<template>
  <v-app>
    <the-header />
    <div></div>
    <v-main>
      <router-view />
    </v-main>
  </v-app>
</template>

<script>
import TheHeader from "./components/TheHeader.vue";

export default {
  components: { TheHeader },
  name: "App",
  data: () => ({
    //
  }),
};
</script>

<style scoped>
</style>