import Vue from 'vue';
import Router from 'vue-router';
import Home from '@/components/Home';
import Destination from '@/components/Destination';
import Signin from '@/components/Signin';
import AddDestination from '@/components/AddDestination';
import EditDestination from '@/components/EditDestination';
import Signup from '@/components/Signup';


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
      path: '/signup',
      name: 'Signup',
      component: Signup,
    },

    {
      path: '/addNewDestination',
      name: 'AddDestination',
      component: AddDestination,
    },
    {
      path: '/updateDestination',
      name: 'EditDestination',
      component: EditDestination,
    },
  ],
});
