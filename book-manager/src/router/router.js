import Vue from "vue";
import Router from "vue-router";
import Home from "../views/Home.vue";
import reception from '../views/reception/Index.vue'
import manager from '../views/admin/Index.vue'

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: "/",
      name: "home",
      component: Home
    },
    {
      path: "/manager",
      name: "manager",
      component: manager,
      children:[

      ]
    },
    {
      path: "/reception",
      name: "reception",
      component: reception
    }
   
  ]
});
