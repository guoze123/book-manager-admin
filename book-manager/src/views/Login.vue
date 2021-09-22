<template>
  <div class="section">
    <div class="ms-login">
      <el-form
        :model="LoginForm"
        status-icon
        ref="LoginForm"
        :rules="rule"
        label-width="0"
        class="login-form"
      >
        <h3>图书馆登录</h3>
        <el-form-item prop="username">
          <el-input type="text" v-model="LoginForm.username" placeholder="账号">
          </el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input
            type="password"
            v-model="LoginForm.password"
            placeholder="密码"
          >
          </el-input>
        </el-form-item>
        <el-form-item>
          <el-button
            type="danger"
            class="submitBtn"
            round
            @click="submit('LoginForm')"
          >
            登录
          </el-button>
          <el-button
            type="primary"
            class="resetBtn"
            round
            @click.native.prevent="reset"
          >
            重置
          </el-button>
          <hr />
          <p>
            还没有账号，马上去&nbsp;<span class="to" @click="toregin"
              >注册</span
            >
          </p>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
import { systemLogin } from "../api/login.js";
import { mapState, mapMutations } from "vuex";
export default {
  data() {
    return {
      LoginForm: {
        username: "",
        password: ""
      },
      rule: {
        username: [
          {
            required: true,
            message: "请输入账号",
            trigger: "blur"
          }
        ],
        password: [
          {
            required: true,
            message: "请输入密码！",
            trigger: "blur"
          }
        ]
      }
    };
  },
  methods: {
    ...mapMutations(["userInfo_mutations"]),
    reset() {
      this.$refs.LoginForm.resetFields();
    },
    toregin() {
      this.$router.push("/register");
    },
    submit(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          console.log(this.LoginForm);
          systemLogin({
            userName: this.LoginForm.username,
            password: this.LoginForm.password
          })
            .then(response => {
              if (response.successful) {
                // 管理界面
                sessionStorage.setItem("authorization",new Date().getTime())
                sessionStorage.setItem("userInfo",JSON.stringify(response.resultValue))
                this.$router.push("/manager")
              } else {
                this.$OnlyMessage.error("用户名或密码错误")
              }
            })
            .catch(error => {
              console.log(error);
            });
        }
      });
    }
  }
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

.login-form {
  margin: 0 auto;
  width: 300px;
  background: #fff;
  box-shadow: 0 0 10px #b4bccc;
  padding: 15px 30px;
  border-radius: 5px;
}
.submitBtn {
  width: 65%;
}
.resetBtn {
  width: 30%;
}
.to {
  color: #67c23a;
  cursor: pointer;
}
.validate-code {
  width: 244px;
  margin-right: 20px;
  float: left;
}
.code {
  height: 40px;
}
h3 {
  text-align: center;
}
</style>
