
let mysql = require("mysql");
let sqlConfig = require("./dbConfig.js");
//建立连接池
let pool = mysql.createPool(sqlConfig.mysql);

function getConnection() {
  return new Promise(function (resolve, reject) {
    pool.getConnection(function (err, conn) {
      if (!err) {
        resolve(conn);
      } else {
        reject(err);
      }
    });
  });
}
//执行sql
function execute(sql) {
  return new Promise(function (resolve, reject) {
    getConnection()
      .then(function (conn) {
        conn.query(sql, function (err, result) {
          if (!err) {
            resolve(result);
            conn.release();
            console.log("释放完成");
          } else {
            reject(err);
          }
        });
      })
      .catch(function (err) {
        reject(err);
      });
  });
}
module.exports = {
  getConnection,
  execute,
};
