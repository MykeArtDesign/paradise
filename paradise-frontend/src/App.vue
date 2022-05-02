<template>
  <div id="app">
    <navbar/>
    <router-view/>
  </div>
</template>

<script>

import Home from '@/components/Home';
import Navbar from './components/Navbar';
import Signin from './components/Signin';


export default {
  name: 'App',
  components: {
    Home,
    Navbar,
    Signin,
  },
};
</script>
