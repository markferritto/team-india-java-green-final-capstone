<template>
  <div class="page-header clear-filter" filter-color="orange">
    <div
      class="page-header-image"
      style="background-image: url('img/login.jpg')"
    ></div>
    <div class="content">
      <div class="container">
        <div class="col-md-5 ml-auto mr-auto">
          <card type="login" plain>
            <div slot="header" class="logo-container">
              <img v-lazy="'img/now-logo.png'" alt="" />
            </div>
          <form class="login" v-on:submit.prevent="login">
            <fg-input
              class="no-border input-lg"
              addon-left-icon="now-ui-icons users_circle-08"
              input required v-model="user.username" type="text" id="username"
              placeholder="Username"
            />
            

            <fg-input
              class="no-border input-lg"
              addon-left-icon="now-ui-icons text_caps-small"
              input required v-model="user.password" type="password" id="password"
              placeholder="Password"
            />
              <div class="card-footer text-center submit">
                <input type="submit"
                  class="btn btn-primary btn-round btn-lg btn-block" value="Submit"
                  >
              </div>
              <div class="pull-left">
                <h6>
                  <router-link :to="{ name: 'register' }">Need an account?</router-link>
                </h6>
              </div>
              <div class="pull-right">
                <h6>
                  <router-link :to="{ name: 'register' }">Need help?</router-link>
                </h6>
              </div>
            </form>
          </card>
        </div>
      </div>
    </div>
    <main-footer></main-footer>
  </div>
</template>
<script>
import { Card, Button, FormGroupInput } from '@/components';
import MainFooter from '@/layout/MainFooter';
import authService from "../services/AuthService.js";
import register from "../pages/Register.vue"

export default {
  name: 'login-page',
  bodyClass: 'login-page',
  components: {
    Card,
    MainFooter,
    
    [Button.name]: Button,
    [FormGroupInput.name]: FormGroupInput,
    
  },
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  
methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (this.response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>
<style></style>
