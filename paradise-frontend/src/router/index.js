import Vue from 'vue';
import Router from 'vue-router';
import Home from '@/components/Home';
import Destination from '@/components/Destination';
import Signin from '@/components/Signin';
import AddDestination from '@/components/AddDestination';


Vue.use(Router);

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home,
    },

    {
      path: '/destinations/:id',
      name: 'Destination',
      component: Destination,
    },
    {
      path: '/signin',
      name: 'Signin',
      component: Signin,
    },

    {
      path: '/newdestination',
      name: 'AddDestination',
      component: AddDestination,
    },
  ],
});
