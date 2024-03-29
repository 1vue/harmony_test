
import { header } from './headers'
@Observed
class Task{
  static id:number=1
  name :string=`任务${Task.id++}`

  finished:boolean=false


}

@Styles function card(){
  .width('95%')
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(15)
  .shadow({radius:6,color:'#1F000000',offsetX:2,offsetY:4})

}

@Styles function fillScreen(){
  .width('100%')
  .height('100%')
  .backgroundColor('F1F2F3')
  .padding(20)
}

@Extend(Text) function finishedTask(){
  .decoration({type:TextDecorationType.LineThrough})
  .fontColor('#B1B2B1')

}


@Entry
@Component
struct task{
  @State TotalTask:number=0
  @State finishedTask:number=0
build(){
Column({space:10}){

  header({title:'任务清单'})

  taskData({TotalTask:this.TotalTask,finishedTask:this.finishedTask})
  taskList({TotalTask:$TotalTask,finishedTask:$finishedTask})

}.fillScreen()


}

}


@Component
struct taskData {

  @Prop TotalTask:number
  @Prop finishedTask:number


  build() {



    // 数据统计
    Row(){


      Text("任务进度：")
        .fontWeight(FontWeight.Bold)
        .fontSize(22)

      Stack(){
        Progress({
          value:this.finishedTask,

          total:this.TotalTask,

          type:ProgressType.Ring


        }).width(100)


        Row(){
          Text(this.finishedTask.toString())
            .fontSize(24)
          Text(' / '+this.TotalTask.toString())
            .fontSize(24)
        }
      }

    }.card()
    .margin({top:5})
    .justifyContent(FlexAlign.SpaceEvenly)

  }
}


@Component
struct taskList {

  @Link TotalTask:number
  @Link finishedTask:number
  @State Tasks:Task[]=[]

  handerChange(){
    this.finishedTask=this.Tasks.filter(task=>task.finished).length
    this.TotalTask=this.Tasks.length
  }

  @Builder deleteButton(index:number){
    Button(){
      Image($r('app.media.delete'))
        .width(30)
    }.width(40)
    .height(40)
    .backgroundColor(Color.White)
    .type(ButtonType.Circle)
    .margin({left:5})
    .onClick(()=>{
      this.Tasks.splice(index,1)
      this.handerChange()

    })


  }

  build() {

Column(){
  Row(){
    Button('新增任务')
      .width(150)
      .onClick(()=>{
        this.Tasks.push(new Task())
        this.TotalTask=this.Tasks.length

      })
  }

  List({space:10}){

    ForEach(
      this.Tasks,
      (task:Task,index)=>{
        ListItem(){
         taskitem({task:task,ontaskChange:this.handerChange.bind(this)})

        }.swipeAction({end:this.deleteButton(index)})

      }


    )
  }.width('100%')
  .height(500)
  // .layoutWeight(1)
  .alignListItem(ListItemAlign.Center)


}

  }
}


@Component
struct taskitem {

  @ObjectLink task:Task

  ontaskChange:()=>void

  build() {
    Row(){
      if(this.task.finished)
        Text(this.task.name)
          .finishedTask()
      else
        Text(this.task.name)
      //
      Checkbox()
        .select(this.task.finished)
        .selectedColor(0xed6f21)

        .onChange(val=>{
          // 更新当前任务状态
          this.task.finished=val
          // 更新已完成任务数量
          this.ontaskChange()
        })
    }.card()
    .justifyContent(FlexAlign.SpaceBetween)
  }
}
