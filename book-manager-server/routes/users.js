let express = require("express");
let router = express.Router();
let loginDB = require("../data_base/loginDB");
let registerDB = require("../data_base/registerDB.js");
/* GET users listing. */


// 查找用户名和密码
router.post("/login", (req, res) => {
  let name = req.body.userName;
  let pass = req.body.password;
  console.log(name);
  console.log(pass);
  loginDB
    .select_name(name)
    .then((data) => {
      let responseJSON = {
        errorPage: "",
        resultHint: "",
        resultValue: "",
        successful: true,
        type: "",
      };
      console.log(data[0]);
      if (data[0] == undefined) {
        console.log("error");
        res.send("-1");
      } else if (data[0] != undefined) {
        loginDB
          .select_password(name)
          .then((data) => {
            console.log(data[0].password);
            if (data[0].password != pass) {
              console.log("error");
              res.send("0");
            } else if (name == "admin") {
              res.send("1");
              console.log("管理员登录");
            } else {
              res.send("ok");
              console.log("学生登录");
            }
          })
          .catch((error) => {
            res.send(error);
          });
      }
    })
    .catch((error) => {
      res.send(error);
    });
});

router.post("/register", (req, res) => {
  var name = req.body.userName;
  var pass = req.body.password;
  let nickName = req.body.nickName;
  let sex = req.body.sex;
  let email = req.body.email;
  console.log(name);
  console.log(pass);
  registerDB
    .select_name(name)
    .then((data) => {
      if (data[0] != undefined) {
        res.send("-1");
      } else {
        registerDB
          .insert_user(name, pass,nickName,sex,email)
          .then((data) => {
            console.log(data);
            res.send(data);
          })
          .catch((error) => {
            res.send(error);
          });
      }
    })
    .catch((error) => {
      res.send(error);
    });
});

module.exports = router;
