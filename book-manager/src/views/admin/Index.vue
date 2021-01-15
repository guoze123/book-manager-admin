<template>
  <div class="configuration">
    <el-container class="index-con">
      <el-aside class="index-aside" width="auto">
        <el-menu
          :default-active="menuactive"
          :router="true"
          background-color="#2f3e4e"
          text-color="#fff"
          active-text-color="#409eff"
          class="el-menu-vertical-demo"
          :collapse="isCollapse"
          :unique-opened="true"
        >
          <div class="index-aside-title">
            <span>国家电网</span>
          </div>
          <template v-for="(v, index) in this.menudata">
            <el-submenu
              :index="index + ''"
              v-if="v.childSysMenus && v.childSysMenus.length > 0"
              :key="v.id"
            >
              <template slot="title">
                <i :class="v.img"></i>
                <span slot="title" :title="v.name">{{ v.name }}</span>
              </template>
              <template v-for="item in v.childSysMenus">
                <el-menu-item
                  :index="item.resUrl"
                  :route="item.resUrl"
                  :key="item.id"
                >
                  <i :class="item.img"></i>
                  <span slot="title" :title="item.name">{{ item.name }}</span>
                </el-menu-item>
              </template>
            </el-submenu>
            <template v-else>
              <el-menu-item :index="v.resUrl" :route="v.resUrl" :key="v.id">
                <i :class="v.img"></i>
                <span slot="title" :title="v.name">{{ v.name }}</span>
              </el-menu-item>
            </template>
          </template>
        </el-menu>
      </el-aside>
      <el-container class="index-con">
        <el-header>
          <div class="index-header">
            <div class="right-menu">
              <el-dropdown class="avatar-container">
                <div class="avatar-wrapper">
                  <img
                    src="@/assets/images/user.png"
                    class="user-avatar"
                    alt=""
                  />
                  <span class="user-name">{{ "sfsdf" }}</span>
                  <i class="el-icon-caret-bottom arrow-down"></i>
                </div>
                <el-dropdown-menu slot="dropdown">
                  <el-dropdown-item>
                    <span >退出登录</span>
                  </el-dropdown-item>
                </el-dropdown-menu>
              </el-dropdown>
            </div>
          </div>
        </el-header>
        <el-main class="index-main">
          <router-view></router-view>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
export default {
  name: "AdminManager",
  data() {
    return {
        menuactive:"",
        isCollapse: false,
        menudata:[]
    };
  },

  components: {},
  created() {},
  mounted() {},
  methods: {},
  watch: {},
};
</script>
<style lang="scss" scoped>
.configuration {
  width: 100%;
  height: 100%;
  .index-con {
    width: 100%;
    height: 100%;
    .el-header {
      padding: 0;
      .el-tabs__header {
        margin: 0;
      }
      .el-tabs__item {
        padding: 0 15px;
      }
      .el-tabs__item.is-active {
        color: #ffffff;
        background: #409eff;
      }
      .el-tabs__nav-wrap::after {
        height: 0;
      }
      .el-tabs__active-bar {
        height: 0;
      }
    }
    .index-header {
      position: relative;
      background: rgb(255, 255, 255);
      // box-shadow: 0 1px 4px rgba(0, 21, 41, 0.08);
      display: flex;
      align-items: center;
      justify-content: space-between;
      height: 60px;
      padding: 0 15px;
      .header-i {
        height: 50px;
        line-height: 50px;
        display: flex;
        align-items: center;
        i {
          font-size: 30px;
          transition: all(0.5s);
          cursor: pointer;
        }
        .iconactive {
          transform: rotate(90deg);
        }
        .header-title {
          margin-left: 10px;
        }
      }
      .right-menu {
        display: flex;
        align-items: center;
        .avatar-container {
          cursor: pointer;
          padding: 0 8px;
          .avatar-wrapper {
            position: relative;
            margin-right: 20px;
            align-items: center;
            display: flex;
            .user-name {
              display: inline-block;
              font-weight: 600;
              margin: 0 5px;
              max-width: 80px;
              text-overflow: ellipsis;
              white-space: nowrap;
              overflow: hidden;
            }
            .user-avatar {
              width: 40px;
              height: 40px;
              border-radius: 10px;
            }
            .arrow-down {
              cursor: pointer;
              position: absolute;
              right: -20px;
            }
          }
        }
      }
    }
    .tabs-header {
      width: 100%;
    }
    .index-aside {
      .el-menu-vertical-demo:not(.el-menu--collapse) {
        width: 200px;
        min-height: 100%;
      }
      .el-menu--collapse {
        min-height: 100%;
      }
      .index-aside-title {
        display: flex;
        align-items: center;
        height: 60px;
        background-color: #2f3e4e;
        color: #fff;
        padding: 0 17px;
        box-sizing: border-box;
        line-height: 60px;
        text-align: left;
        overflow: hidden;
        i {
          font-size: 36px;
          margin: 12px 0;
        }
        span {
          margin-left: 10px;
          font-size: 22px;
          vertical-align: top;
        }
        img {
          width: 40px;
          height: 40px;
        }
      }
      .el-menu-item,
      .el-submenu {
        text-align: left;
      }
    }
    .index-main {
      background-color: #f9f9f9;
    }
    /*导航栏样式优化*/
    .el-menu-item,
    .el-submenu__title {
      opacity: 0.6;
      background: #272c33;
    }
    .el-menu-item.is-active {
      opacity: 1;
      background-color: #1890ff !important;
      color: #ffffff !important;
    }
    .el-submenu__title:hover,
    .el-menu-item:hover,
    .el-submenu.is-active.is-opened .el-submenu__title {
      opacity: 1 !important;
    }
    .el-submenu.is-active.is-opened .el-menu--inline .is-active {
      opacity: 1;
      background-color: #1890ff !important;
      color: #ffffff !important;
    }
  }
}
</style>
