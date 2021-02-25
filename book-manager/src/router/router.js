import Vue from "vue";
import Router from "vue-router";
import Home from "../views/Home.vue";
import reception from "../views/reception/Index.vue";
import manager from "../views/admin/Index.vue";
import login from "../views/Login.vue";
import NProgress from "nprogress";
import register from "../views/Register.vue";
import notFound from "../views/404.vue";
import paramsConfig from "../views/admin/ParamsConfig.vue";
Vue.use(Router);

let router = new Router({
  routes: [
    {
      path: "/manager",
      name: "manager",
      component: manager,
      redirect: "/manager/home",
      children: [
        {
          path: "/manager/home",
          name: "首页",
          component: () =>
            import(/* webpackChunkName: "about" */ "../views/admin/Home.vue")
        },
        {
          path: "/manager/bookManager",
          name: "图书管理",
          component: () =>  import(/* webpackChunkName: "about" */ "../views/admin/BookManager.vue")
        },
        {
          path: "/manager/userManager",
          name: "人员管理",
          component: () =>  import(/* webpackChunkName: "about" */ "../views/admin/UserManager.vue")
        },
        {
          path: "/manager/LeaveMessage",
          name: "留言管理",
          component: () =>  import(/* webpackChunkName: "about" */ "../views/admin/LeaveMessage.vue")
        },
        {
          path: "/manager/setTing",
          name: "参数设置",
          component: paramsConfig,
          children: [
            {
              path: "/manager/setTing/pressManager",
              name: "出版社管理",
              component: () =>  import(/* webpackChunkName: "about" */ "../views/admin/PressManager.vue")
            },
            {
              path: "/manager/setTing/bookType",
              name: "图书类型管理",
              component: () =>  import(/* webpackChunkName: "about" */ "../views/admin/BookType.vue")
            }
          ]
        }
      ]
    },
    {
      path: "/reception",
      name: "reception",
      component: reception
    },
    {
      path: "/login",
      name: "login",
      component: login
    },
    {
      path: "/register",
      name: "register",
      component: register
    },
    {
      path: "*",
      name: "notFound",
      component: notFound
    }
  ]
});
//  全局路由守卫
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

export default router;
