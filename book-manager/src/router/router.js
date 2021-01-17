import Vue from "vue";
import Router from "vue-router";
import Home from "../views/Home.vue";
import reception from "../views/reception/Index.vue";
import manager from "../views/admin/Index.vue";
import login from '../views/Login.vue'
import NProgress from "nprogress"
import register from '../views/Register.vue'
import notFound from '../views/404.vue';
Vue.use(Router);

let router = new Router({
  routes: [
    {
      path: "/manager",
      name: "manager",
      component: manager,
      children: [

      ],
    },
    {
      path: "/reception",
      name: "reception",
      component: reception,
    },
    {
      path: "/login",
      name: "login",
      component: login,
    },
    {
      path: "/register",
      name: "register",
      component: register,
    },
    {
      path: "*",
      name: "notFound",
      component: notFound,
    },
  ],
});
// // 全局路由守卫
router.beforeEach((to, form, next) => {
  // 获取token
  NProgress.start();
  const tokenStr = window.sessionStorage.getItem("authorization");
  if (to.path === "/login" || to.path === "/register") {
    next();
  } else {
    if (tokenStr) {
      next();
    } else {
      next({ path: "/login" });
    }
  }
});
router.afterEach(() => {
  NProgress.done();
});


export default router
