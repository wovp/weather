import router from '@ohos.router'
@Entry
@Component
struct Qidong {
    @State message: string = 'Hello World'

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

    build() {
        Row() {
            Image($r('app.media.nn'))
                .width(40)
            Text('每日天气新闻')
                .fontSize(40)
                .fontColor(Color.Pink)
            Image($r('app.media.ww'))
                .width(40)
        }
        .justifyContent(FlexAlign.Center)
        .height('100%')
        .width('100%')
        .backgroundImage($r('app.media.wallhaven_qzp835'))
        .backgroundImageSize(ImageSize.Cover)
        .onAppear(() => {
            animateTo({
                duration: 1000,
                onFinish: () => { // 到时间之后直接跳转
                    setTimeout(() => {
                        router.replaceUrl({
                            url: 'pages/Index'
                        })
                    }, 1000)
                }
            }, () => {

            })
        })
    }
}