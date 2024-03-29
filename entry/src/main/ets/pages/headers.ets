import router from '@ohos.router'
@Component
export  struct header{
  private title:ResourceStr

  @State param:any=router.getParams()

  build(){

    Row(){
      Image($r('app.media.return'))
        .width(30)
        .onClick(()=>{

          router.showAlertBeforeBackPage({message:'信息尚未填写完成，确认返回？'})
          router.back()
        })

      Text(this.title)
        .fontSize(25)
        .fontWeight(FontWeight.Bold)

      if(this.param&&this.title)
      {
        Text(this.param.id+'.'+this.title)
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }

      Blank()
      Image($r('app.media.reflash'))
        .width(30)
    }
    .width('100%')
    .height(30)
    // .margin({bottom:20})
    // .justifyContent(FlexAlign.SpaceBetween)


  }
}