<template>
  <div>
    <div class="search">
      <div>
        昵称：
        <el-input placeholder="输入昵称"></el-input>
      </div>
      <div>
        账号：
        <el-input placeholder="输入账号"></el-input>
      </div>
      <div>
        <el-button type="primary">查询</el-button>
        <el-button type="primary" @click="openEditDialog">添加</el-button>
      </div>
    </div>
    <el-table :data="tableData" style="width: 100%" border>
      <el-table-column fixed prop="date" label="名称" width="150">
      </el-table-column>
      <el-table-column prop="name" label="性别" width="120"> </el-table-column>
      <el-table-column prop="province" label="账号" width="120">
      </el-table-column>
      <el-table-column prop="city" label="密码" width="120"> </el-table-column>
      <el-table-column prop="address" label="手机号码" width="120">
      </el-table-column>
      <el-table-column prop="zip" label="邮箱" width="120"> </el-table-column>
      <el-table-column prop="zip" label="证件类型" width="120">
      </el-table-column>
      <el-table-column prop="zip" label="证件号码"> </el-table-column>
      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button size="mini" @click="handleEdit(scope.$index, scope.row)"
            >编辑</el-button
          >
          <el-button
            size="mini"
            type="danger"
            @click="handleDelete(scope.$index, scope.row)"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>
    <EditUser v-if="showEdit" @closeEditUser="closeEditUser"></EditUser>
  </div>
</template>

<script>
import EditUser from "../../components/user-manager/EditUser.vue";
export default {
  data() {
    return {
      showEdit: false,
      tableData: []
    };
  },

  components: {
    EditUser
  },
  created() {},
  mounted() {},
  methods: {
    openEditDialog() {
      this.showEdit = true;
    },
    closeEditUser() {
      this.showEdit = false;
    }
  },

  watch: {}
};
</script>
<style lang="scss" scoped>
.search {
  display: flex;
  margin-bottom: 10px;
  & > div {
    display: flex;
    align-items: center;
    width: 220px;
    .el-input {
      width: 150px;
    }
  }
}
</style>
