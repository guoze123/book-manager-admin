/**axios封装
 * 请求拦截、相应拦截、错误统一处理
 */
import axios from "axios";
import qs from "qs";
import { Loading } from "element-ui";
let loading; //定义loading变量
let needLoadingRequestCount = 0;

function showFullScreenLoading() {
  if (needLoadingRequestCount === 0) {
    startLoading();
  }
  needLoadingRequestCount++;
}

function tryHideFullScreenLoading() {
  if (needLoadingRequestCount <= 0) return;
  needLoadingRequestCount--;
  if (needLoadingRequestCount === 0) {
    endLoading();
  }
}

// 请求超时时间
axios.defaults.timeout = 1000 * 60;
axios.defaults.baseURL = "/api";
axios.defaults.withCredentials = true;
axios.interceptors.request.use(
  config => {
    showFullScreenLoading();
    return config;
  },
  error => {
    return Promise.reject(error);
  }
);

// http response 拦截器
axios.interceptors.response.use(
  response => {
    tryHideFullScreenLoading();
    if (
      response.request.responseType == "blob" ||
      response.request.responseType === "arraybuffer"
    ) {
      let fileName = response.config.params.fileName; //处理文件名乱码问题
      fileDownload(response.data, fileName);
    } else {
      return Promise.resolve(response.data);
    }
  },
  error => {
    tryHideFullScreenLoading();
    let { response } = error;
    if (response) {
      // 服务器有返回结果
      return Promise.reject(error.response);
    } else {
      // 断网处理
      alert("请检查服务器情况");
      if (!window.navigator.onLine) {
        return;
      }
      return Promise.reject(error);
    }
  }
);

function apiAxios(url, params) {
  return new Promise((resolve, reject) => {
    let options = {
      contentType: "application/json;charset=UTF-8",
      method: "post",
      params: {}
    };
    options = {
      ...options,
      ...params
    };
    if (options.contentType.includes("application/x-www-form-urlencoded")) {
      options.params = qs.stringify(options.params);
    }
    axios({
      method: options.method,
      url: url,
      data: options.params,
      headers: {
        "content-type": options.contentType,
        Authorization: options.token
      }
    }).then(
      function(res) {
        resolve(res);
      },
      function(err) {
        reject(err);
      }
    );
  });
}
// 针对导出文件
function apiExportFile(url, params) {
  return new Promise((resolve, reject) => {
    axios({
      method: "get",
      params,
      responseType: "blob",
      url
    })
      .then(res => {
        if (res) {
          resolve(res);
        }
      })
      .catch(error => {
        reject(error);
      });
  });
}
/**
 *
 * @param {*} url
 * @param {Object} params
 * {
 *  params:{}
 * }
 */
function apiAxiosForm(url, params) {
  return new Promise((resolve, reject) => {
    let options = {
      contentType: "application/x-www-form-urlencoded;charset=UTF-8",
      method: "post",
      params: {}
    };
    options = {
      ...options,
      ...params
    };
    options.params = qs.stringify(options.params);
    axios({
      method: options.method,
      url: url,
      data: options.params,
      headers: {
        "content-type": options.contentType,
        Authorization: options.token
      }
    }).then(
      function(res) {
        resolve(res);
      },
      function(err) {
        reject(err);
      }
    );
  });
}

function startLoading() {
  //使用Element loading-start 方法
  loading = Loading.service({
    lock: true,
    text: "加载中……",
    background: "rgba(0, 0, 0, 0.7)"
  });
}

function endLoading() {
  //使用Element loading-close 方法
  loading.close();
}

function fileDownload(data, fileName) {
  let blob = new Blob([data], {
    type:
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8"
  });
  let filename = fileName || "filename.xls";
  if (typeof window.navigator.msSaveBlob !== "undefined") {
    window.navigator.msSaveBlob(blob, filename);
  } else {
    var blobURL = window.URL.createObjectURL(blob);
    var tempLink = document.createElement("a");
    tempLink.style.display = "none";
    tempLink.href = blobURL;
    tempLink.setAttribute("download", filename);
    if (typeof tempLink.download === "undefined") {
      tempLink.setAttribute("target", "_blank");
    }
    document.body.appendChild(tempLink);
    tempLink.click();
    document.body.removeChild(tempLink);
    window.URL.revokeObjectURL(blobURL);
  }
}

export { apiAxios, apiAxiosForm, apiExportFile };
