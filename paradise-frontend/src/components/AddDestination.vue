<template>
  <section class="pt-100">
    <div class="container">
      <h2 class="mb-3"> Ajouter une destination</h2>
      <div class="mb-3 col-sm-4">
        <label for="name" class="form-label">Nom de la destination</label>
        <input type="text" v-model="name" class="form-control" id="name" placeholder="Paris">
      </div>
      <div class="mb-3 col-sm-4">
        <label for="address" class="form-label">Adresse de la destination</label>
        <input type="text" v-model="address" class="form-control" id="address" placeholder="Paris, France">
      </div>
      <div class="mb-3 col-sm-4">
        <label for="description" class="form-label">Ajouter une description</label>
        <textarea v-model="description" class="form-control" id="description" rows="3"></textarea>
      </div>
      <div class="mb-3 col-sm-4">
        <label for="rate" class="form-label">Ajouter une note (/5)</label>
        <input type="number" v-model.number="rate" class="form-control" id="rate" placeholder="5">
      </div>
      <div class="mb-3 col-sm-4">
        <label for="image" class="form-label">Ajouter une photo (url)</label>
        <input type="text" v-model="photo_url" class="form-control" id="image">
      </div>
      <input type="hidden" v-model="user_id">
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
      name: '',
      address: '',
      description: '',
      rate: '',
      photo_url: '',
      user_id: window.localStorage.getItem('user'),

    };
  },
  methods: {

  //   addNewDestination() {
  //     API.post('/api/v1/destinations/', {
  //       destinations: {
  //         name: this.newDestination.name,
  //         address: this.newDestination.address,
  //         description: this.newDestination.description,
  //         rate: this.newDestination.rate,
  //         photo_url: this.newDestination.photo_url,
  //       },
  //     })
  //       .then((response) => {
  //         this.destinations = response.data;
  //       });
  //   },
    async addNewDestination() {
      try {
        const destination = await axios.post(
          'http://localhost:3000/api/v1/destinations',
          {
            name: this.name,
            address: this.eaddress,
            description: this.description,
            rate: this.rate,
            photo_url: this.photo_url,
            user_id: this.user_id,
          },
        );

        console.log(destination);
      } catch (e) {
        console.log(e);
      }
    },

  },
};
</script>

<style scoped>
  .pt-100 {
    padding-top: 100px;
  }
</style>
