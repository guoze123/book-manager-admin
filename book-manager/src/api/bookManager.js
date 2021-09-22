import { apiAxios } from "../utils/request.js";
let queryBook = function(params = {}){
  return apiAxios("/bookManager/query", {
    params,
  });
};

export {queryBook}
