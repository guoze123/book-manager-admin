const { log } = require('debug');
let pool=require('./pool');
module.exports={
    // 查找用户名
    select_name(name) {
        let sql= 'select * from user where us_userName ="'+name+'" ';
        return pool.execute(sql);
    },
    // 注册
    insert_user(name,pass,nickName,sex,email) {
        let sql= `insert into user values(null,"${name}","${pass}","${nickName}","${sex}","${email}",null, null,null)`;
        return pool.execute(sql);
    },
}