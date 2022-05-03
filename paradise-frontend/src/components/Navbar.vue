<template>

  <header>
    <div class="container">
      <nav>
        <div id="logo" class="nav-link">
          <a href="/">DESTINATION</a>
        </div>

        <div class="navigation-bar">
          <button v-if="isLoggedIn" class="btn btn-danger" v-on:click="logout" >Se deconnecter</button>
          <router-link to="/" @click.prevent="logout" v-if="!login()">Se deconnecter</router-link>
          <!-- <button v-else class="btn btn-primary" v-on:click="login" >Se connecter</button> -->
          <router-link to="/signin" v-esle class="btn btn-primary">Sign in</router-link>
                <!-- <ul>
                  <li><button v-if="isLoggedIn" class="btn btn-danger" v-on:click="logout">Se deconnecter</button></li>
                  <li><button v-else class="btn btn-primary" v-on:click="login" >Se connecter</button></li>
                  <li><router-link to="/signin" v-if="!login()">Sign in</router-link></li>
                  <li><router-link to="/signup" v-if="!login()">Sign up</router-link></li>
                  <li><router-link to="/signin">Se connecter</router-link></li>
                  <li><router-link to="/" @click.prevent="logout" v-if="!login()">Se deconnecter</router-link></li>
                  <li><a href="#" @click.prevent="logout" v-if="login()">Sign out</a></li>
                </ul> -->
        </div>
      </nav>
    </div>
  </header>

</template>

<script>
import { API } from '../backend/index';

export default {
  name: 'Navbar',

  created() {
    this.login();
  },

  methods: {
    login() {
      return localStorage.login;
    },
    logout() {
      API.delete('/sigin')
        .then(() => {
          localStorage.clear();
          this.$router.replace('/');
        });
    },
  },
};
</script>
