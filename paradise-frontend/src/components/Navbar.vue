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
          <!-- <router-link to="/signup" @click.prevent="logout" v-if="!login()">Créer un compte</router-link>
          <button class="btn btn-primary" v-on:click="trylogin" >Se connecter</button>
          <button v-if="!isLoggedIn" class="btn btn-primary" v-on:click="trylogin" >Se connecter</button> -->
        <router-link to="/signin" class="btn btn-link" v-if="!signin()" >Sign in</router-link>
        <router-link to="/signup" class="btn btn-link" v-if="!signin()">Sign Up</router-link>
        <a href="/" @click.prevent="signOut" class="btn btn-link" v-if="signin()">Sign out</a>
        </div>
      </nav>
    </div>
  </header>

</template>

<script>

export default {
  name: 'Navbar',
  created() {
    this.signin();
  },

  methods: {
    signin() {
      return localStorage.signin;
    },
    signOut() {
      delete localStorage.removeItem.signin;
      window.localStorage.removeItem('jwt_access_token');
      window.localStorage.removeItem('user');
      window.location.replace('http://localhost:8080/');
    },
  },
};
</script>
