<template>

  <header>
    <div class="container">
      <nav>
        <div id="logo" class="nav-link">
          <a href="/">PARADISE</a>
        </div>

        <div class="navigation-bar">
          <!-- <button v-if="isLoggedIn" class="btn btn-danger" v-on:click="logout" >Se deconnecter</button> -->
          <!-- <router-link to="/" @click.prevent="logout" v-if="!login()">Se deconnecter</router-link> -->
          <!-- <button v-else class="btn btn-primary" v-on:click="login" >Se connecter</button> -->
          <!-- <button v-esle class="btn btn-primary" v-on:click="trylogin" >Se connecter</button> -->
        </div>
      </nav>
    </div>
  </header>

</template>

<script>
// import { API } from '../backend/index';

export default {
  name: 'Navbar',

  computed: {
    isLoggedIn() {
      return window.localStorage.getItem('jwt_access_token');
    },
  },

  methods: {
    trylogin() {
      this.$router.replace('/signin');
    },
    logout() {
      window.localStorage.removeItem('jwt_access_token');
      window.location.replace('http://localhost:8080/');
    },
  },
};
</script>
