<template>
  <section class="sign in pt-100">
    <div class="container">
      <h3 class="mb-3">Créer un compte</h3>
      <div class="mb-3">
        <label for="email" class="form-label">E-mail</label>
        <input type="text" v-model="input.email" class="form-control" id="email" placeholder="Entrer un email">
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Mot de passe</label>
        <input type="password" v-model="input.password" class="form-control" id="password" placeholder="Entrer un mot de passe">
      </div>
      <div class="mb-3">
        <label for="password_confirmation" class="form-label">Mot de passe</label>
        <input type="password" v-model="input.password_confirmation" class="form-control" id="password-confirmation" placeholder="Confirmez votre mot de passe">
        <button v-on:click="Signup" class="mt-3 btn btn-primary" type="submit">Valider</button>
      </div>
    </div>
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
        password_confirmation: '',
      },
    };
  },
  methods: {
    Signup() {
      if (this.email !== '' && this.password !== '' && this.password_confirmation !== '') {
        API.post('/users', {
          email: this.input.email,
          password: this.input.password,
          password_confirmation: this.input.password_confirmation,
        })

          .then(() => {
            this.$router.push('/signin');
          })
          .catch(error => console.log(error));
      }
      return null;
    },
  },
};
</script>
