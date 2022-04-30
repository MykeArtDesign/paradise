<template>
  <div>
    <h3>Sign In</h3>
  </div>
</template>

<script>
const axios = require('axios').default;

export default {
  name: 'Home',
  data() {
    return {
      destinations: null,
    };
  },
  mounted() {
    axios.get('http://localhost:3000/api/v1/destinations')
      .then((response) => {
        this.destinations = response.data;
      });
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
  color: black;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
