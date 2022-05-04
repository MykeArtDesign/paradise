<template>
  <section class="sign in pt-100">
    <div class="container">
      <h3 class="mb-3">Créer un compte</h3>
      <div class="mb-3">
        <label for="email" class="form-label">E-mail</label>
        <input type="text" v-model="email" class="form-control" id="email" placeholder="john.doe@gmail.com">
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Mot de passe</label>
        <input type="password" v-model="password" class="form-control" id="password" placeholder="******">
      </div>
      <div class="mb-3">
        <label for="password_confirmation" class="form-label">Mot de passe</label>
        <input type="password" v-model="password_confirmation" class="form-control" id="password-confirmation" placeholder="Confirmez votre mot de passe">
        <button v-on:click="Signup" class="mt-3 btn btn-primary" type="submit">Valider</button>
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
      email: '',
      password: '',
      password_confirmation: '',
    };
  },
  methods: {
    Signup() {
      if (this.email !== '' && this.password !== '' && this.password_confirmation) {
        API.post('/users', {
          email: this.email,
          password: this.password,
          password_confirmation: this.password_confirmation,
        })

          .then((response) => {
            setSession(response.data.access);
            localStorage.signin = true;
            window.location.replace('http://localhost:8080/');
          })
          .catch(error => console.log(error));
      }
      return null;
    },
  },
};
</script>
