<template>
    <section class="destinations">
      <div class="container pt-100">
      <div class="banner">
        <img :src="destination.photo_url" alt="image-destination">
        <h1> {{destination.name}}</h1>
          <h3>{{destination.address}}</h3>
      </div>
          <p>{{destination.description}}</p>
      </div>
      <router-link to="/updateDestination" class="btn btn-warning">Modifier</router-link>
      <button @click="deleteDestination(destination.id)" class="btn btn-danger">Supprimer</button>
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
