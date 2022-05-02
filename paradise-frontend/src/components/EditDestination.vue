<template>
  <section>
    <form action="">
      <div>
        <label for="name" id="name">Entrer un nouveau nom: </label>
        <input
          v-model="destination.name" type="text" id="name">
      </div>
      <div>
        <label for="address" id="adress">Modifier l'adresse</label>
        <input
          v-model="destination.address" type="text" id="address">
      </div>
      <div>
        <label for="description" id="description">Modifier la description</label>
        <input
          v-model="destination.description" type="text" id="description">
      </div>
      <div>
        <label for="rate" id="rate">Modifier la note (/5)</label>
        <input
          v-model="destination.rate" type="range" id="range">
      </div>
      <div>
        <label for="image" id="image">Modifier la photo (url)</label>
        <input
          v-model="destination.photo_url" type="text" id="image">
      </div>

      <button v-on:click="updateDestination" type="submit">Modifier</button>
    </form>
  </section>
</template>

<script>
import { API } from '../backend/index';

export default {
  name: 'EditDestination',
  data() {
    return {
      destination: {
        name: '',
        address: '',
        description: '',
        rate: '',
        photo_url: '',
      },
    };
  },
  methods: {
    updateDestination(destination) {
      API.patch(`/api/v1/destinations/${destination.id}`, {
        destination: {
          name: this.newDestination.name,
          address: this.newDestination.address,
          description: this.newDestination.description,
          rate: this.newDestination.rate,
          photo_url: this.newDestination.photo_url,
        },
      })
        .catch(error => this.console.log(error));
    },
  },
};
</script>
