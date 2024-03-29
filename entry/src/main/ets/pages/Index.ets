
import router from '@ohos.router'
@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
@State url1:string='pages/task'
  @State url2:string='pages/itemPage'

  build() {
    Row() {


      Column() {


        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Image('https://consumer.huawei.com/content/dam/huawei-cbg-site/cn/mkt/pdp/phones/mate60-pro/img/design/design-color-1@2x.webp')
          .width(300)

        Image($r('app.media.icon'))
          .width(200)
          .interpolation(ImageInterpolation.Medium)

        Button('登录')
          .width(100)
          .onClick(()=>{
router.pushUrl(

  {url:this.url1},
  router.RouterMode.Single,
err=>{
  if(err){
    console.log(`路由失败${err.code},${err.message}`)
  }
}
)

          })

      }.onClick(()=>{
        this.message="你好"
      })

      .width('100%')
    }
    .height('100%')
  }
}