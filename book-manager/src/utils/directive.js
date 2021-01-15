export default {
  // 自定义指令节流函数
  antiSnake: {
    timing: 1000, // 默认设置间隔1000毫秒
    // 自定义指令中钩子函数
    bind: (el, binding) => {
      if (binding.value) {
        debugger;
        this.timing = binding.value;
      }
    },
    inserted: el => {
      let timer = null;
      el.addEventListener("mouseenter", () => {
        if (!timer) {
          el.disabled = true;
          timer = setTimeout(() => {
            clearTimeout(timer);
            timer = null;
            el.removeAttribute("disabled");
          }, this.timing);
        }
      });
    }
  }
};
