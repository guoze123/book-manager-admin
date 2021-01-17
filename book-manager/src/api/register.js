import { apiAxios } from "../utils/request.js";
let systemRegister = function(params = {}){
  return apiAxios("/users/register", {
    params,
  });
};

export {systemRegister}
