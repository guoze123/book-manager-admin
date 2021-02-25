<template>
  <div>
    <div class="search">
      <div>
        名称：
        <el-input placeholder="名称"></el-input>
      </div>
      <div>
        <el-button type="primary">查询</el-button>
        <el-button type="primary" @click="openEditDialog">添加</el-button>
      </div>
    </div>
    <el-table :data="tableData" style="width: 100%" border>
      <el-table-column prop="name" label="出版社名称" width="150">
      </el-table-column>
      <el-table-column label="操作">
        <template>
          <el-button size="mini" type="danger">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
export default {
  data() {
    return {
      tableData: [
        {
          name: "234234"
        }
      ]
    };
  },

  components: {},
  created() {},
  mounted() {},
  methods: {},
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
