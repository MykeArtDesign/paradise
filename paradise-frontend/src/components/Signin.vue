<template>
    <section class="sign in pt-100">
    <h3>Sign In</h3>
      <form>
        <div>
          <label for="email">E-mail</label>
          <input type="email" v-model="input.email" id="email">
        </div>

        <div>
          <label for="password">Mot de passe</label>
          <input type="password" v-model="input.password" id="password">
        </div>

        <button v-on:click="login" type="submit">Sign In</button>
      </form>
    </section>
</template>

<script>

import { API } from '../backend/index';

export default {
  name: 'Destination',
  data() {
    return {
      input: {
        email: '',
        password: '',
      },
    };
  },
  methods: {
    login() {
      API.post('/signin', {
        email: this.input.email,
        password: this.input.password,
      })
        .then((response) => {
          this.setSession(response.data);
          this.$router.push('/');
        })
        .catch(error => this.console.log(error));
    },
  },
};
</script >

<style scoped>
 .pt-100 {
   padding-top: 100px;
 }
</style>
