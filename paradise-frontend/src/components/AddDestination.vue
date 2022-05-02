<template>
  <section class="pt-100">
    <form action="">
      <div>
        <label for="name" id="name">Nom de la destination</label>
        <input
          placeholder="Paris, Barcelone"
          v-model="newDestination.name" type="text" id="name">
      </div>
      <div>
        <label for="address" id="adress">Adresse de la destination</label>
        <input
          v-model="newDestination.address" type="text" id="address">
      </div>
      <div>
        <label for="description" id="description">Ajouter une description</label>
        <input
          placeholder="ajouter du texte..."
          v-model="newDestination.description" type="text" id="description">
      </div>
      <div>
        <label for="rate" id="rate">Ajouter une note (/5)</label>
        <input
          v-model="newDestination.rate" type="range" id="range">
      </div>
      <div>
        <label for="image" id="image">Ajouter une photo (url)</label>
        <input
          v-model="newDestination.photo_url" type="text" id="image">
      </div>

      <button v-on:click="addNewDestination" type="submit">Ajouter </button>
    </form>
  </section>
</template>

<script>
import { API } from '../backend/index';

export default {
  name: 'AddDestination',
  data() {
    return {
      newDestination: {
        name: '',
        address: '',
        description: '',
        rate: '',
        photo_url: '',
      },
    };
  },
  methods: {
    addNewDestination() {
      API.post('/api/v1/destinations/', {
        destinations: {
          name: this.newDestination.name,
          address: this.newDestination.address,
          description: this.newDestination.description,
          rate: this.newDestination.rate,
          photo_url: this.newDestination.photo_url,
        },
      })
        .then((response) => {
          this.destinations.push(response.data);
          this.newDestination = '';
        })
        .catch(error => this.console.log(error));
    },
  },
};
</script>

<style scoped>
  .pt-100 {
    padding-top: 100px;
  }
</style>
