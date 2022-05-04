<template>
  <section>
    <div class="container pt-4">
      <div class="alert alert-primary" role="alert" v-if="error !== ''">
          {{error}}
      </div>
      <h2 class="mb-3"> Modifier une destination</h2>
      <div class="mb-3 col-sm-4">
        <label for="name" class="form-label">Entrer un nouveau nom</label>
        <input type="text" v-model="destination.name" class="form-control" id="name" placeholder="Paris">
      </div>
      <div class="mb-3 col-sm-4">
        <label for="address" class="form-label">Modifier l'adresse</label>
        <input type="text" v-model="destination.address" class="form-control" id="address" placeholder="Paris, France">
      </div>
      <div class="mb-3 col-sm-4">
        <label for="description" class="form-label">Modifier la description</label>
        <textarea v-model="destination.description" class="form-control" id="description" rows="3"></textarea>
      </div>
      <div class="mb-3 col-sm-4">
        <label for="rate" class="form-label">Modifier la note (/5)</label>
        <input type="number" v-model.number="destination.rate" class="form-control" id="rate" placeholder="5">
      </div>
      <div class="mb-3 col-sm-4">
        <label for="image" class="form-label">Modifier la photo (url)</label>
        <input type="text" v-model="destination.photo_url" class="form-control" id="image">
      </div>
    <button v-on:click="updateDestination(id)" class="btn btn-primary disabled" type="submit">Modifier</button>
    </div>
  </section>
</template>

<script>
import { API } from '../backend/index';

export default {
  name: 'EditDestination',
  data() {
    return {
      error: '',
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
    setError(error, text) {
      this.error = (error.response && error.response.data && error.response.data.error) || text;
    },
    updateDestination(id) {
      API.put(`/api/v1/destinations/${id}`, {
        destination: {
          name: this.destination.name,
          address: this.destination.address,
          description: this.destination.description,
          rate: this.destination.rate,
          photo_url: this.destination.photo_url,
        },
      })
        .then(() => {
          this.$router.push(`/destination/${this.$route.params.id}`);
        })
        .catch((error) => {
          this.setError(error, 'Cannot edit destination');
        });
    },
  },
};
</script>
