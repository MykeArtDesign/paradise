<template>
  <section>
    <div class="container pt-4">
      <div class="alert alert-primary" role="alert" v-if="error !== ''">
        {{error}}
      </div>
      <h2 class="mb-3"> Ajouter une destination</h2>
      <div class="mb-3 col-sm-4">
        <label for="name" class="form-label">Nom de la destination</label>
        <input type="text" v-model="destination.name" class="form-control" id="name" placeholder="Paris">
      </div>
      <div class="mb-3 col-sm-4">
        <label for="address" class="form-label">Adresse de la destination</label>
        <input type="text" v-model="destination.address" class="form-control" id="address" placeholder="Paris, France">
      </div>
      <div class="mb-3 col-sm-4">
        <label for="description" class="form-label">Ajouter une description</label>
        <textarea v-model="destination.description" class="form-control" id="description" rows="3"></textarea>
      </div>
      <div class="mb-3 col-sm-4">
        <label for="rate" class="form-label">Ajouter une note (/5)</label>
        <input type="number" v-model.number="destination.rate" class="form-control" id="rate" placeholder="5">
      </div>
      <div class="mb-3 col-sm-4">
        <label for="image" class="form-label">Ajouter une photo (url)</label>
        <input type="text" v-model="destination.photo_url" class="form-control" id="image">
      </div>
      <input type="hidden" v-model="destination.user_id">
    <button v-on:click="addNewDestination" type="submit" class="mt-3 btn btn-primary">Ajouter </button>
    </div>
  </section>
</template>

<script>

// import { API } from '../backend/index';
import axios from 'axios';

export default {
  name: 'AddDestination',
  data() {
    return {
      error: '',
      destination: {
        name: '',
        address: '',
        description: '',
        rate: '',
        photo_url: '',
        user_id: window.localStorage.getItem('user'),
      },
    };
  },
  methods: {
    setError(error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text;
    },
    addNewDestination() {
      axios.post('http://localhost:3000/api/v1/destinations',
        {
          name: this.destination.name,
          address: this.destination.address,
          description: this.destination.description,
          rate: this.destination.rate,
          photo_url: this.destination.photo_url,
          user_id: this.destination.user_id,
        })
        .then(() => {
          this.$router.push('/');
        })
        .catch((error) => {
          this.setError(error, 'Cannot create destination');
        });
    },

  },
};
</script>
