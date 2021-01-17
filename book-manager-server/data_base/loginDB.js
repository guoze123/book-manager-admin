var pool=require('./pool');

module.exports={
    // 查找用户名
    select_name(name) {
        var sql= 'select * from user where us_userName ="'+name+'" ';
        return pool.execute(sql);
    },
    // 查找用户名对应的密码
    select_password(name) {
        var sql= 'select us_password from user where us_userName ="'+name+'" ';
        return pool.execute(sql);
    },
    // 修改用户密码
    update_password(name,password) {
        var sql="update user set us_password = '"+password+"' where us_userName ='"+name+"' ";
        return pool.execute(sql);
    } 
}