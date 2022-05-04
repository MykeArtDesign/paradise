<template>
  <section class="sign in pt-100">
    <div class="container">
      <h3 class="mb-3">Se connecter</h3>
      <div class="mb-3">
        <label for="email" class="form-label">E-mail</label>
        <input type="text" v-model="input.email" class="form-control" id="email" placeholder="Entrer un email">
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Mot de passe</label>
        <input type="password" v-model="input.password" class="form-control" id="password" placeholder="Entrer un mot de passe">
        <button v-on:click="login" class="mt-3 btn btn-primary" type="submit">Me connecter</button>
      </div>
    </div>
  </section>
</template>

<script>

import { API, setSession } from '../backend/index';

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
      if (this.input.email !== '' && this.input.password !== '') {
        API.post('/signin', {
          email: this.input.email,
          password: this.input.password,
        })
          .then((response) => {
            setSession(response.data.session.access, response.data.user.id);
            this.$router.push('/');
          })
          .catch(error => console.log(error));
      }
      return null;
    },
  },
};
</script >
