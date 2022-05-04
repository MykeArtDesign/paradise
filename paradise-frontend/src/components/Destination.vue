<template>
    <section>
      <div id="destination-banner" :style="{backgroundImage:`url(${destination.photo_url})`}">
        <div class="container" >
          <h1 class="mx-auto"> {{destination.name}}</h1>
          <span class="badge bg-light rounded-pill"> ⭐️: {{ destination.rate}}</span>
        </div>
      </div>
      <div class="col-12 col-md-6 rounded-3 shadow-sm p-4 px-5 my-5">
        <article>
          <h2><span>Description</span></h2>
          <p class="small">{{destination.address}}</p>
          <p> {{destination.description}}</p>
        </article>
      </div>
      <div class="d-grid gap-2 d-md-block pb-3">
        <router-link :to="`/editDestinations/${destination.id}`" class="btn btn-outline-danger">Modifier</router-link>
        <button @click="deleteDestination(destination.id)" class="btn btn-danger">Supprimer</button>
      </div>
    </section>
</template>

<script>
import { API } from '../backend/index';

export default {
  name: 'Destination',
  data() {
    return {
      destination: {},
    };
  },

  mounted() {
    API.get(`/api/v1/destinations/${this.$route.params.id}`)
      .then((response) => {
        this.destination = response.data;
      });
  },
  methods: {
    deleteDestination(id) {
      API.delete(`/api/v1/destinations/${id}`);
      window.location.replace('http://localhost:8080/');
    },
  },
};
</script>

<style scoped>
  #destination-banner {
    background-position: center;
    background-size: cover;
    padding: 255px 0px;
  }
</style>
