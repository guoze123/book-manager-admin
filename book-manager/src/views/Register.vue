<template>
  <div class="section">
    <div class="ms-login">
      <el-form
        :model="RegisterForm"
        label-width="52px"
        status-icon
        ref="RegisterForm"
        :rules="rule"
        class="register-form"
      >
        <h3>注册新用户</h3>
        <el-form-item prop="userName" label="账号">
          <el-input
            type="text"
            v-model="RegisterForm.userName"
            placeholder="请输入账号"
          >
          </el-input>
        </el-form-item>
        <el-form-item prop="password" label="密码">
          <el-input
            type="password"
            v-model="RegisterForm.password"
            placeholder="请输入密码"
          >
          </el-input>
        </el-form-item>
        <el-form-item prop="nickName" label="昵称">
          <el-input
            type="text"
            v-model="RegisterForm.nickName"
            placeholder="请输入名字"
          >
          </el-input>
        </el-form-item>

        <el-form-item prop="Sex" label="性别">
          <el-radio-group v-model="RegisterForm.sex" size="medium">
            <el-radio border label="男" value="男"></el-radio>
            <el-radio border label="女" value="女"></el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item prop="email" label="邮箱">
          <el-input
            type="text"
            v-model="RegisterForm.email"
            placeholder="请输入邮箱"
          >
          </el-input>
        </el-form-item>
        <el-form-item>
          <el-button
            type="primary"
            class="submitBtn"
            round
            @click="submit('RegisterForm')"
          >
            注册
          </el-button>
          <el-button
            type="danger"
            class="resetBtn"
            round
            @click.native.prevent="reset"
          >
            重置
          </el-button>
          <hr />
          <p>
            返回&nbsp;<span class="to" @click="tologin">登录</span>&nbsp;页面
          </p>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
import { systemRegister } from "../api/register.js";
export default {
  data() {
    return {
      RegisterForm: {
        userName: "",
        password: "",
        nickName: "",
        sex: "",
        email: "",
      },
      rule: {
        userName: [
          {
            required: true,
            message: "请输入账号",
            trigger: "blur",
          },
        ],
        password: [
          {
            required: true,
            message: "请输入密码！",
            trigger: "blur",
          },
        ],
        sex: [
          {
            required: true,
            message: "请选择性别",
            trigger: "blur",
          },
        ],
        nickName: [
          {
            required: true,
            message: "请选择性别",
            trigger: "blur",
          },
        ],
        email: [
          {
            required: true,
            message: "请输入邮箱",
            trigger: "blur",
          },
        ],
      },
    };
  },

  methods: {
    reset() {
      this.$refs.RegisterForm.resetFields();
    },
    tologin() {
      this.$router.push("/login");
    },
    submit(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
            systemRegister(this.RegisterForm).then((response) => {
              if (response.data == -1) {
                this.$message({
                  type: "error",
                  message: "账号不正确",
                });
                console.log("账号不正确");
              } else {
                this.$router.push("/login");
                this.$message({
                  type: "success",
                  message: "注册成功，返回登录页面",
                });
              }
            })
            .catch((error) => {
              console.log(error);
            });
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
  },
};
</script>

<style scoped>
.section {
  position: absolute;
  width: 100%;
  height: 100%;
  background: url("../assets/images/login_bg.png");
  background-size: cover;
  display: flex;
  align-items: center;
  justify-content: center;
}

.register-form {
  margin: 0 auto;
  width: 300px;
  background: #fff;
  box-shadow: 0 0 10px #b4bccc;
  padding: 6px 50px 0 30px;
  border-radius: 5px;
}
.submitBtn {
  margin-left: -20px;
  width: 50%;
}
.resetBtn {
  width: 50%;
}
.to {
  color: aqua;
  cursor: pointer;
}
.ms-login {
  margin-top: 30px;
}
h3 {
  text-align: center;
}
p {
  font-size: 15px;
  margin-top: -6px;
  margin-left: -20px;
}
hr {
  margin-left: -30px;
}
</style>

