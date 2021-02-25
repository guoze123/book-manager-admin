<template>
  <div class="eidt_user">
    <el-dialog
      title="修改人员信息"
      :visible="true"
      width="600px"
      :show-close="false"
    >
      <el-form
        ref="formUser"
        :model="formUser"
        label-width="100px"
      >
        <div class="requirement">
          <el-form-item label="账号" prop="name">
            <el-input
              placeholder=""
              v-model="formUser.name"
              class="inputWidth"
            ></el-input>
          </el-form-item>
          <el-form-item label="密码" prop="name">
            <el-input
              placeholder=""
              v-model="formUser.name"
              class="inputWidth"
            ></el-input>
          </el-form-item>
          <el-form-item label="昵称" prop="name">
            <el-input
              placeholder=""
              v-model="formUser.name"
              class="inputWidth"
            ></el-input>
          </el-form-item>
          <el-form-item label="性别" prop="name">
            <el-select  placeholder=""
              class="inputWidth"

            >
              <el-option label="男" value="男"> </el-option>
              <el-option label="女" value="女"> </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="手机号" prop="name">
            <el-input
              placeholder=""
              v-model="formUser.name"
              class="inputWidth"
            ></el-input>
          </el-form-item>
          <el-form-item label="邮箱" prop="name">
            <el-input
              placeholder=""
              v-model="formUser.name"
              class="inputWidth"
            ></el-input>
          </el-form-item>
          <el-form-item label="证件类型" prop="name">
            <el-input
              placeholder=""
              v-model="formUser.name"
              class="inputWidth"
            ></el-input>
          </el-form-item>
          <el-form-item label="证件号码" prop="name">
            <el-input
              placeholder=""
              v-model="formUser.name"
              class="inputWidth"
            ></el-input>
          </el-form-item>
        </div>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary">
          确定
        </el-button>
        <el-button @click="close('cancel')">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      formUser:{}
    };
  },
  created() {},
  mounted() {},
  methods: {
    close(param) {
      this.$emit("closeEditUser", param);
    }
  },
  watch: {}
};
</script>
<style lang="scss">
.table_info_list {
  .el-pagination {
    width: 100%;
    overflow: auto;
  }
}
</style>
<style lang="scss" scoped>
.inputWidth {
  width: 170px;
  margin-right: 10px;
}
.requirement {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
.table_info_list {
  display: flex;
  justify-content: space-between;
  .table_list,
  .field_list {
    width: 49%;
    border: 1px solid #ccc;
    header {
      width: 100%;
      padding: 8px 0;
      text-align: center;
      background: #f8f8f8;
    }
    .search {
      padding: 5px;
    }
  }
  .field_list {
    width: 49%;
    border: 1px solid #ccc;
  }
}
.data_preview {
  margin-top: 10px;
  .title {
    width: 100%;
    height: auto;
    padding: 0 15px;
    font-size: 15px;
    line-height: 35px;
    background: #f1f6f9;
    border: 1px solid #d3e0e8;
    margin: 5px 0;
    display: block;
  }
}

.fieldRelation {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  & > div {
    margin: 10px 0;
  }
}
</style>
