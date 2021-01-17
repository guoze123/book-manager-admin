import { apiAxios } from "../utils/request.js";
let systemLogin = function(params = {}){
  return apiAxios("/users/login", {
    params,
  });
};

export {systemLogin}
