<template>
  <header>
    <div class="container">
      <nav>
        <div id="logo" class="nav-link">
          <a href="/">DESTINATION</a>
        </div>

        <div class="navigation-bar">
                <ul>
                  <li><router-link to="/signin" v-if="!login()">Sign in</router-link></li>
                  <!-- <li><router-link to="/signin">Se connecter</router-link></li> -->
                  <li><router-link to="/" @click.prevent="logout" v-if="!login()">Se deconnecter</router-link></li>
                  <!-- <li><a href="#" @click.prevent="logout" v-if="login()">Sign out</a></li> -->
                </ul>
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

<style scoped>
  @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

  * {
    margin: 0;
    padding: 0;
    font-family: 'Roboto', sans-serif;
    line-height: 1.3;
    box-sizing: border-box;
    scroll-behavior: smooth;
    color: black;
  }

  .container {
  width: 100%;
  max-width: 1140px;
  margin: 0 auto;
  }

  header {
  height: 83px;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  z-index: 3;
  background-color: ghostwhite;
  transition: all 0.3s ease-in-out;
  }


  /* header.fixed{
    height: 70px;
}

  header.fixed nav {
    height: 70px;
    padding: 15px 0;
  } */

  nav{
    height: 83px;
    width: 100%;
    padding: 20px 0;
    transition: all 0.3s ease-in-out;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  ul {
    padding: 0;
    margin: 0;
    list-style: none;
  }

  a {
    text-decoration: none;
  }
  .navigation-bar ul li {
    position: relative;
    display: inline-block;
    margin: 0 25px;
  }

  .navigation-bar ul li:last-child{
    margin-right: 0px;
  }

  .navigation-bar ul li a{
    position: relative;
    font-size: 16px;
    font-weight: 400;
    transition: all 0.3s ease-in-out;;
  }

  .navigation-bar ul li a:hover {
    color: rgb(60, 122, 229);
  }

</style>
