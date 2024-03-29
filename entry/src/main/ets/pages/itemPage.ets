
import { header } from './headers'

class item{
  name: string
  price: number
  img:ResourceStr

  discount:number
  constructor(name:string,price:number,img:ResourceStr,discount:number=0) {
    this.name=name
    this.price=price
    this.img=img
    this.discount=discount
  }

}


@Builder function itemCard(item:item){
  Row({space:10}) {
    Image(item.img)
      .width(100)
    Column({space:4}){
      if(item.discount){
        Text(item.name)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        Text('原价:  $ '+item.price)
          .fontColor('#ccc')
          .fontSize(18)
          .decoration({type:TextDecorationType.LineThrough})

        Text('折扣价:  $ '+(item.price-item.discount))
          .pricecolor()

        Text('补贴:  $ '+item.discount)
          .pricecolor()
      }
      else {

        Text(item.name)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        Text('$'+item.price)
          .fontColor('red')
          .fontSize(18)
      }

    }
    .height("100%")

    .alignItems(HorizontalAlign.Start)
  }.width("100%")
  .backgroundColor('#FFF')
  .borderRadius(20)
  .height(120)
  .padding(20)
}

@Styles function fillScreen(){
  .width('100%')
  .height('100%')
  .backgroundColor('#EFEFEF')
  .padding(20)
}

@Extend(Text) function pricecolor(){
  .fontColor('red')
  .fontSize(18)
}

@Entry
@Component
struct itemPage {

  @State imgSrc:string ='https://res.vmallres.com/pimages/uomcdn/CN/pms/202403/gbom/6942103109584/428_428_9D3B788CDF5A83F6820BCA9411A6899Dmp.png'

  private items:Array<item>=[
new item('华为Mate60',1000,this.imgSrc,500),
    new item('华为Mate70',1200,this.imgSrc),
    new item('华为Mate80',1000,this.imgSrc),
    new item('华为Mate80',1000,this.imgSrc),
    new item('华为Mate80',1000,this.imgSrc),
    new item('华为Mate80',1000,this.imgSrc),
    new item('华为Mate90',1000,this.imgSrc)

  ]

  build() {

    Column() {

header({title:'商品列表'})

      List({space:10}){
        ForEach(
          this.items,
          (item:item)=>{
            ListItem(){
             itemCard(item)

            }

          }

        )
      }.width("100%")
      .layoutWeight(1)

      // .padding({top:30,left:40})
    }.fillScreen()
  }
}