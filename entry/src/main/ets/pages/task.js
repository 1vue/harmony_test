"use strict";
class Task {
    constructor() {
        this.name = `任务${Task.id}`;
        this.finished = false;
    }
}
Task.id = 1;
function card() {
    
  
        .width('95%')
        .padding(20)
        .backgroundColor(Color.White)
        .borderRadius(15)
        .shadow({ radius: 6, color: '#1F000000', offsetX: 2, offsetY: 4 });
}
function finishedTask() {
    
  
        .decoration({ type: TextDecorationType.LineThrough })
        .fontColor('#B1B2B1');
}
struct task extends  {
    constructor(
    ) {
    }
    build() {
        .width('100%')
            .height('100%')
            .backgroundColor('F1F2F3');
    }
}
//# sourceMappingURL=task.js.map