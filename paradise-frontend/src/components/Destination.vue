<template>
    <section>
      <div id="destination-banner" :style="{backgroundImage:`url(${destination.photo_url})`}">
        <div class="container" >
          <h3 class="text-center"><span class="badge bg-dark rounded-pill"> ⭐️ : {{ destination.rate}}</span></h3>
        </div>
      </div>
      <h1 class="pt-4"> {{destination.name}}</h1>
      <div class="col-12 col-md-6 rounded-3 shadow-sm p-4 px-5 m-5 ">
        <article>
          <h2><span>Description</span></h2>
          <p class="small">{{destination.address}}</p>
          <p> {{destination.description}}</p>
        </article>
      </div>
      <div class="d-grid gap-2 d-md-block pb-3">
        <router-link :to="{name: 'EditDestination', params: {id: destination.id} }" class="ms-5 btn btn-outline-danger">Modifier</router-link>
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
