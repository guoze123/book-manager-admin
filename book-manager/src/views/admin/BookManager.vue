<template>
  <div style="height: 100%">
    <div class="search">
      <div>
        书名：
        <el-input placeholder="书名"></el-input>
      </div>
      <div>
        作者：
        <el-input placeholder="作者名称"></el-input>
      </div>
      <div>
        出版社：
        <el-input placeholder="出版社"></el-input>
      </div>
      <div>
        类型：
        <el-input placeholder="类型"></el-input>
      </div>
      <div>
        <el-button type="primary">查询</el-button>
        <el-button type="primary" @click="openEditBook">添加</el-button>
      </div>
    </div>
    <el-table :data="tableData" style="width: 100%" border height="calc( 100% - 100px )">
      <el-table-column fixed prop="b_name" label="书名" width="150">
      </el-table-column>
      <el-table-column prop="b_author" label="作者" width="120"> </el-table-column>
      <el-table-column prop="b_btid" label="类型" width="120">
      </el-table-column>
      <el-table-column prop="b_publisher" label="出版社" width="120">
      </el-table-column>
      <el-table-column prop="b_intime" label="入库时间" width="120">
      </el-table-column>
      <el-table-column prop="b_booknumall" label="入库总数" width="120">
      </el-table-column>
      <el-table-column prop="b_booknum" label="剩余数量" width="120">
      </el-table-column>
      <el-table-column prop="b_introduce"  show-overflow-tooltip label="内容介绍"> </el-table-column>
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
    <EditBook v-if="showEdit"
    @closeEditBook="closeEditBook"
    ></EditBook>
  </div>
</template>

<script>
import EditBook from "../../components/book-manager/EditBook.vue"
import { queryBook } from '../../api/bookManager.js'
export default {
  data() {
    return {
      tableData: [],
      showEdit:false,
    };
  },

  components: {
    EditBook
  },
  created() {
    this.queryBook()
  },
  mounted() {},
  methods: {
    queryBook(bookName = "",bookAuthor = "") {
      queryBook({
        bookName:bookName,
        bookAuthor: bookAuthor
      }).then((res) =>{
        this.tableData = res.resultValue
      })
    },
    closeEditBook(){
      this.showEdit = false;
    },
    openEditBook() {
      this.showEdit = true;
    }
  },

  watch: {}
};
</script>
<style lang="scss" scoped>
.search{
  display:flex;
  margin-bottom: 10px;
  &>div{
    display:flex;
    align-items: center;
    width: 220px;
    .el-input{
      width:150px;
    }
  }

}
</style>
