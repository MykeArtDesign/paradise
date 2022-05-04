<template>

  <header>
    <div class="container">
      <nav>
        <div id="logo" class="nav-link">
          <a href="/">PARADISE</a>
        </div>

        <div class="navigation-bar">
        <router-link to="/signin" class="btn btn-outline-primary" v-if="!signin()" >Sign in</router-link>
        <router-link to="/signup" class="btn btn-primary" v-if="!signin()">Sign Up</router-link>
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

<style scoped>
 #logo a {
   color: var(--color-second);
   font-size: var(--text-medium);
   font-weight: var(--font-weight-regular);
   letter-spacing: 2px;

 }
</style>
