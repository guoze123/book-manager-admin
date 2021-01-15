export function toTreeData(data, id, pid, label) {
  let parent = [];
  for (let i = 0; i < data.length; i++) {
    if (data[i][pid] == "") {
      data[i][pid] = null;
    }
    if (data[i].children === null) {
      data[i].children = [];
    }
    if (data[i][pid] !== "0") {
    } else {
      let obj = {
        id: data[i][id],
        label: data[i][label],
        children: [],
        ...data[i]
      };
      parent.push(obj);
    }
  }
  children(parent);
  // 调用子节点方法,参数为父节点的数组
  function children(parent) {
    if (data.length !== 0) {
      for (let i = 0; i < parent.length; i++) {
        for (let j = 0; j < data.length; j++) {
          if (parent[i].id == data[j][pid]) {
            let obj = {
              id: data[j][id],
              label: data[j][label],
              children: [],
              ...data[j]
            };
            parent[i].children.push(obj);
          }
        }
        children(parent[i].children);
      }
    }
  }
  return parent;
}

/**
 * @description 将扁平化数据 转换成 树状结构
 * @param {Array} arrayList 扁平化的数据
 * @param {String} pidStr parentId的key名
 * @param {String} idStr id的key名
 * @param {String} childrenStr children的key名
 */
export function treeFommat(
  arrayList,
  pidStr = "pid",
  idStr = "id",
  childrenStr = "children"
) {
  let listOjb = {}; // 用来储存{key: obj}格式的对象
  let treeList = []; // 用来储存最终树形结构数据的数组
  // 将数据变换成{key: obj}格式，方便下面处理数据
  for (let i = 0; i < arrayList.length; i++) {
    listOjb[arrayList[i][idStr]] = arrayList[i];
  }
  // 根据pid来将数据进行格式化
  for (let j = 0; j < arrayList.length; j++) {
    // 判断父级是否存在
    let haveParent = listOjb[arrayList[j][pidStr]];
    if (haveParent) {
      // 如果有没有父级children字段，就创建一个children字段
      !haveParent[childrenStr] && (haveParent[childrenStr] = []);
      // 在父级里插入子项
      haveParent[childrenStr].push(arrayList[j]);
    } else {
      // 如果没有父级直接插入到最外层
      treeList.push(arrayList[j]);
    }
  }
  return treeList;
}

export function toTree(data, id, parentId) {
  // 删除 所有 children,以防止多次调用
  data.forEach(function(item) {
    delete item.children;
  });

  // 将数据存储为 以 id 为 KEY 的 map 索引数据列
  var map = {};
  data.forEach(function(item) {
    map[item[id]] = item;
  });
  //        console.log(map);

  var val = [];
  data.forEach(function(item) {
    // 以当前遍历项，的parentid,去map对象中找到索引的id
    var parent = map[item[parentId]];

    // 如果找到索引，那么说明此项不在顶级当中,那么需要把此项添加到，他对应的父级中
    if (parent) {
      (parent.children || (parent.children = [])).push(item);
    } else {
      //如果没有在map中找到对应的索引ID,那么直接把 当前的item添加到 val结果集中，作为顶级
      val.push(item);
    }
  });
  return val;
}

export const list2tree = (list, parentMenuId) => {
  return list.filter(item => {
    if (item.parentOrgId === parentMenuId) {
      item.children = list2tree(list, item.id);
      return true;
    }
    return false;
  });
};
