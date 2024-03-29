@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State imagewidth:number=200

  build() {

      Column() {

        Row() {
          Image('https://consumer.huawei.com/content/dam/huawei-cbg-site/cn/mkt/pdp/phones/mate60-pro/img/design/design-color-1@2x.webp')
            .width(this.imagewidth)
        }
        .justifyContent(FlexAlign.Center)
        .width('100%')
        .height(200)

        Row(){
          Text($r('app.string.width_label'))
            .fontSize(20)
            .fontWeight(FontWeight.Bold)


          TextInput({placeholder:'请输入图片宽度'})
            .width(150)
            .backgroundColor('#36D')
            .type(InputType.Number)
            .onChange(value=>{
              this.imagewidth=parseInt(value)
            })
            .margin(70)

        }
        .width(300)
        // .justifyContent(FlexAlign.Center)
        // .backgroundColor("red")

Row(){
  Button('缩小')
    .width(80)
    .margin(10)
    .fontSize(20)
    .onClick(()=>{
      if(this.imagewidth-10>0)
        this.imagewidth-=10
    })

  Button('放大')
    .width(80)
    .fontSize(20)
    .margin(5)
    .onClick(()=>{
      if(this.imagewidth<300)
        this.imagewidth+=10
    })

}
.width("100%")
.justifyContent(FlexAlign.SpaceEvenly)



        Row(){
          Slider({
            min:100,
            max:300,
            step:1,
            value:this.imagewidth,
            style:SliderStyle.InSet
          })
            .width('80%')
            .blockColor('#36D')
              // .trackColor('red')
              // .trackThickness(10)
            .showTips(true)
            .onChange(value=>{
              this.imagewidth=value
            })
        }

      }
      .justifyContent(FlexAlign.SpaceEvenly)
      .height('70%')
      .width('100%')



  }
}