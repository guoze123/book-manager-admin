// element ui message封装，避免同一消息反复弹出
import { Message } from "element-ui";

const showMessage = Symbol("showMessage");
/**
 *  single  默认值， 默认只弹出一个
 */
class OnlyMessage {
  success(options, single = true) {
    this[showMessage]("success", options, single);
  }

  warning(options, single = true) {
    this[showMessage]("warning", options, single);
  }

  info(options, single = true) {
    this[showMessage]("info", options, single);
  }

  error(options, single = true) {
    this[showMessage]("error", options, single);
  }

  [showMessage](type, options, single) {
    if (single) {
      //判断是否已存在Message
      if (document.getElementsByClassName("el-message").length === 0) {
        Message[type](options);
      }
    } else {
      Message[type](options);
    }
  }
}

export default new OnlyMessage();
