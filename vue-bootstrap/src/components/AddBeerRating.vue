<template>
  <div>
    <label for="rating-10">Overall:</label>
    <b-form-rating id="rating-10" v-model="value10" stars="10" show-value precision="2"></b-form-rating>
    <p class="mt-2">Value: {{ value10 }}</p>
    <label for="rating-10">Body:</label>
    <b-form-rating id="rating-10" v-model="value10" stars="10" show-value precision="2"></b-form-rating>
    <p class="mt-2">Value: {{ value10 }}</p>
    <label for="rating-10">Finish:</label>
    <b-form-rating id="rating-10" v-model="value10" stars="10" show-value precision="2"></b-form-rating>
    <p class="mt-2">Value: {{ value10 }}</p>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        value: ""
      }
    }
  }
</script>