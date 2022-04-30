<template>
  <div id="app">
    <h1>Le nom des destinations</h1>
    <router-view/>
  </div>
</template>

<script>
import Home from '@/components/Home';

export default {
  name: 'App',
  components: {
    Home,
  },
};
</script>
