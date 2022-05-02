<template>
  <div class="hello">
    <section class="hero">
      <div class="container pt-100">
        <div class="banner">
          <h1>Lorem, ipsum dolor.</h1>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
          <router-link to="/newdestination" class="btn btn-flat" >Ajouter une destination</router-link>
        </div>
      </div>
    </section>

    <section class="destinations pt-100">
      <div class="container pt-100">
          <div class="cards">
          <div :key="index" v-for="(destination, index) in destinations">
            <div class="card-white">
              <img :src="destination.photo_url" alt="image-destination">
              <h3>{{destination.name}}</h3>
              <p>{{destination.address}}</p>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
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
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
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
  .pt-100{
    padding-top: 100px;
    }

  .container {
    width: 100%;
    max-width: 1140px;
    margin: 0 auto;
  }

  .banner h1 {
    font-size: 32px;
    font-weight: 700;
  }

  .banner p {
    font-size: 16px;
    margin-bottom: 20px;
  }

  a {
    text-decoration: none;
  }

  .btn-flat {
  color: white;
  padding: 8px 24px;
  background: rgb(60, 122, 229);
  transition: all 0.3s ease;
}

  .btn-flat:hover {
    background: rgb(46, 96, 182);
    color: white;
  }

  .cards{
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
  }

  .card-white{
  background-color: white;
  border-radius: 5px;
  padding: 22px;
  box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1);
  margin: 10px;
  }
  .card-white img{
    width: 100%;
    border-radius: 5px;
    object-fit: cover;
    height: 180px;

  }
</style>
