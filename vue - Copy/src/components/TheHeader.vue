<template>
  <div>
      <nav>
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>
      <router-link v-bind:to="{ name: 'breweries' }">Breweries</router-link>
      <router-link v-bind:to="{ name: 'open-brewery' }">OpenBrewery</router-link>
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
      </nav>
  </div>
</template>

<script>
export default {
    name: 'the-header',
    data() {
        return {
          
        }
    }

}
</script>

<style scoped>
* {
    background-color: #15b467;
}
nav {
    display: flex;
    justify-content: center;
}

nav a {
    padding: 15px 25px;
    background-color: #15b467;
    color:black;
}

nav a:hover {
    background-color: rgb(8, 104, 8);
    color: white;
}
</style>