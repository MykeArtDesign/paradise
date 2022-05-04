<template>

  <section class="hero">
    <div class="banner">
      <h1> Voyagez en un clique !</h1>
      <p>Parce que voyager, c’est partir à la découverte de l’autre, découvrez les plus belles destinations à visiter</p>
      <!-- <button class="btn btn-primary">Ajouter une destination </button> -->
   <router-link to="/addNewDestination" class="btn btn-primary">Ajouter une destination</router-link>
    </div>
  <div class="destinations">
    <div class="container-global pt-100">
      <h2> Les destinations</h2>
        <div class="cards">
          <div :key="index" v-for="(destination, index) in destinations">
            <router-link :to="`/destinations/${destination.id}`">
              <div class="card-white">
                <img :src="destination.photo_url" alt="image-destination">
                <h3>{{destination.name}}</h3>
                <p>{{destination.address}}</p>
              </div>
            </router-link>
          </div>
        </div>
    </div>
  </div>
  </section>

</template>

<script>

import { API } from '../backend/index';


export default {
  name: 'Home',
  data() {
    return {
      destinations: [],
    };
  },

  mounted() {
    API.get('/')
      .then((response) => {
        this.destinations = response.data;
      });
  },

  methods: {
    // checkLocalStorage() {
    //   if (localStorage.getItem('jwt_access_token') !== null) {
    //     this.$router.push('/addNewDestination');
    //   } else {
    //     this.$router.push('/signin');
    //   }
    // },
  },
};
</script>

<style scoped>
  .banner {
    background-image: url("https://images.unsplash.com/photo-1615051179134-62696ea77ef9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1752&q=80");
    background-position: center;
    background-size: cover;
    padding: 255px 0px;
    text-align: center;
  }
  section {
    height: 100vh;
    padding-bottom: 100px;
  }
  .pt-100{
    padding-top: 100px;
    }

  .banner h1 {
    color: var(--color-forth);
    font-size: 45px;
    font-weight: 700;
  }

  .banner p {
    color:rgba(0, 51, 102, 0.6);
    font-size: 24px;
    width: 50%;
    margin: 30px auto;
  }

</style>
