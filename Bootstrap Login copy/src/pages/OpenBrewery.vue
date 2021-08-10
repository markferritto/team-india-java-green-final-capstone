<template>
  <div class="open-brewery">
      <h1>Open Brewery display</h1>
      <open-brewery-info />
  </div>
</template>

<script>
import OpenBreweryInfo from '../components/OpenBreweryInfo.vue';

export default {
    name: "open-brewery",
    components: {
        OpenBreweryInfo,
    },
};
</script>