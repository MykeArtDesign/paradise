<template>
    <section class="destinations pt-100">
          <h1>en attente de résultat</h1>
      <div class="container pt-100">
        <div class="banner">
          <img :src="destination.photo_url" alt="image-destination">
        </div>
          <h1>{{destination.name}}</h1>
          <h3>{{destination.address}}</h3>
          <p>{{destination.description}}</p>
      </div>

    </section>
</template>

<script>
import { API } from '../backend/index';
// import axios from 'axios';

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

  // created() {
  //   getUser(item) {
  //     axios.get(`https://localhost:3000/api/v1/destinations/${item.id}`)
  //     .then((response) => {
  //       this.destination = response.data;
  //       })
  //     .catch(error => {
  //       console.log(error);
  //       })
  //   }
  // },
  // const ID = Number(this.$route.params.id);
  // const destinationId = this.destinations.find(destination => destination.id === ID);
  // this.destination = destinationId;
  // console.log(destinationId);
  // mounted() {
  // API.get('/destinations/1')
  //   .then((response) => {
  //     this.destination = response.data;
  //   });
  // },

};
</script>
