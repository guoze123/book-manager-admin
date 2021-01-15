import Vue from "vue";
import App from "./App.vue";
import router from "./router/router.js";
import store from "./store/store.js";
import ElementUI from "element-ui";

import "element-ui/lib/theme-chalk/index.css";
import  './assets/style/common.scss'
Vue.config.productionTip = false;
Vue.use(ElementUI, {
  size: "small",
});
import OnlyMessage from "./utils/onlyMessage.js";
Vue.prototype.$OnlyMessage = OnlyMessage;

import { apiAxios } from "./utils/request.js";
Vue.prototype.$Axios = apiAxios;
new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");
