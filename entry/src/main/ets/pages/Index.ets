import newsData from '../model/newsData'
import weatherData from '../model/weatherData'
import { httpNewsGet, httpWeatherGet } from '../utils/HttpUtil'

import router from '@ohos.router';
@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  weatherHost: string = 'https://ali-weather.showapi.com'
  weatherPath: string = '/area-to-weather'

  newsHost: string = 'https://jisunews.market.alicloudapi.com'
  newsPath: string = '/news/get'
  @State nowNews: newsData[] = [];
  @State weekWeather: weatherData[] = [];
  @State nowTem: string = "0";
  @State chooseCity: string = "重庆"
  @State bigWeatherPic: Resource = $r('app.media.qinglang')


  pageTransition() {
    // 定义页面进入时的效果，从右侧滑入，时长为1000ms，页面栈发生push操作时该效果才生效
    PageTransitionEnter({ type: RouteType.Push, duration: 1000 })
      .slide(SlideEffect.Right)
    // 定义页面进入时的效果，从左侧滑入，时长为1000ms，页面栈发生pop操作时该效果才生效
    PageTransitionEnter({ type: RouteType.Pop, duration: 1000 })
      .slide(SlideEffect.Left)
    // 定义页面退出时的效果，向左侧滑出，时长为1000ms，页面栈发生push操作时该效果才生效
    PageTransitionExit({ type: RouteType.Push, duration: 1000 })
      .slide(SlideEffect.Left)
    // 定义页面退出时的效果，向右侧滑出，时长为1000ms，页面栈发生pop操作时该效果才生效
    PageTransitionExit({ type: RouteType.Pop, duration: 1000 })
      .slide(SlideEffect.Right)
  }

  async aboutToAppear(){
    let resultWeatherJson = await httpWeatherGet(this.weatherHost + this.weatherPath);
    this.manageWeatherJson(resultWeatherJson["result"]);
    let resultNewsJson = await httpNewsGet(this.newsHost + this.newsPath)
    this.manageNewsJson(resultNewsJson["result"]);
    if (this.weekWeather[0].day_weather !== '晴') {
      this.bigWeatherPic = $r('app.media.yintian')
    }
  }

  public manageWeatherJson(resultJson){
    let showapi_res_body = resultJson["showapi_res_body"];
    let now = showapi_res_body["now"]
    this.nowTem = now["temperature"];
    let f1 = showapi_res_body["f1"];
    let f2 = showapi_res_body["f2"];
    let f3 = showapi_res_body["f3"];
    let f4 = showapi_res_body["f4"];
    let f5 = showapi_res_body["f5"];
    let f6 = showapi_res_body["f6"];
    let f7 = showapi_res_body["f7"];

    let g1 = new weatherData(f1);
    let g2 = new weatherData(f2);
    let g3 = new weatherData(f3);
    let g4 = new weatherData(f4);
    let g5 = new weatherData(f5);
    let g6 = new weatherData(f6);
    let g7 = new weatherData(f7);

    this.weekWeather.push(g1)
    this.weekWeather.push(g2)
    this.weekWeather.push(g3)
    this.weekWeather.push(g4)
    this.weekWeather.push(g5)
    this.weekWeather.push(g6)
    this.weekWeather.push(g7)

  }

  public manageNewsJson(resultJson){
    let newsList = resultJson["showapi_res_body"]["pagebean"]["contentlist"]
    for (let index = 0; index < newsList.length; index++) {
      const element = newsList[index];
      let nn: newsData = new newsData(element);
      this.nowNews.push(nn);
    }
  }
  @Builder
  smallWeather(resour: Resource, da: string){
    Row(){
      Image(resour)
        .width(30)
      Text(da)
    }
    .width("100%")
    .justifyContent(FlexAlign.Start)
  }

  @Builder
  bigWeatherTem(dTempleture: string, nTempleture: string, dWeather: string){
    Column(){
      Row(){
        Text(this.nowTem)
          .fontSize(80)
        Text("℃")
          .fontSize(30)
      }
      Row({space: 10}){
        Text(dWeather)
        Text(dTempleture + "~" + nTempleture + "℃")
      }

    }
  }

  @Builder
  newsShowItem(nn: newsData){
    Column({space: 10}){
      Row({space: 5}){
        Image($r('app.media.xinwen'))
          .width(30)
        Text(nn.title)
          .fontWeight(FontWeight.Medium)
          .fontSize(22)
      }

      Row() {
        Image($r('app.media.newtime'))
          .width(20)
        Text(nn.pubDate)
          .fontSize(16)
      }
      Button("详情")
        .onClick(() => {
          this.onJumpNewsDetailClick(nn.link)

        })
      Row(){
        Image($r('app.media.newtime'))
          .width(15)
        Text(nn.source)
          .fontSize(12)

      }

      // Web({ src: nn.link, controller: this.webviewController})
    }
    .alignItems(HorizontalAlign.Start)

  }

  @Builder
  showWeatherList(){
    Column() {
      Column() {
        Text('每日天气')
          .backgroundColor('#1260e5ac')
      }

      Column() {
        Text(this.chooseCity)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')

      Divider()
      Column() {
        if (this.weekWeather.length > 0) {
          this.smallWeather($r("app.media.ziwaixian"), this.weekWeather[0].ziwaixian)
          this.smallWeather($r("app.media.qiya"), this.weekWeather[0].air_press)
          this.bigWeatherTem(this.weekWeather[0].day_air_temperature, this.weekWeather[0].night_air_temperature, this.weekWeather[0].day_weather)

        }
      }

      Column() {
        List({ space: 20 }) {
          ForEach(this.weekWeather, (item: weatherData) => {
            ListItem() {
              Column() {
                Text(item.day)
                Image(item.day_weather_pic)
                  .width(30)
                Text(item.day_air_temperature + "℃")
                Text(item.night_air_temperature + "℃")
              }
            }
          })
        }
        .height('100%')
        .width('100%')
        .listDirection(Axis.Horizontal)
      }

    }
    .height('100%')
    .width('100%')
    .backgroundImage(this.bigWeatherPic)
    .backgroundImageSize(ImageSize.Cover)
  }

  @Builder
  showNewsList(){
    Column() {
      Column() {
        Text('每日新闻')
          .backgroundColor('#1260e5ac')
      }

      List({ space: 40 }) {
        ForEach(this.nowNews, (item: newsData) => {
          ListItem() {
            this.newsShowItem(item);
          }
        }, item => item.link)
      }
      .height('100%')
      .width('100%')
    }

  }
  build() {
    Column(){

      Tabs({ barPosition: BarPosition.End }){
        TabContent(){
          this.showWeatherList()
        }
        .tabBar('天气')
        TabContent(){
          this.showNewsList()
        }
        .tabBar('新闻')
      }
    }

  }

  public onJumpNewsDetailClick(newsLink: string): void {
    let pa = {
      nnn: newsLink
    }

  router.pushUrl({
    url: 'pages/newsShow', // 目标url
    params: pa,
  }, router.RouterMode.Standard, (err) => {
    if (err) {
      console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
      return;
    }
    console.info('Invoke pushUrl succeeded.');
  });

}

}
