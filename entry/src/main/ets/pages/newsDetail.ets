import web_webview from '@ohos.web.webview';
import router from '@ohos.router';
@Entry
@Component
struct newsDetail{
    webviewController: web_webview.WebviewController = new web_webview.WebviewController();
    @State lili: string = "0"
    onPageShow(){
        const params = router.getParams(); // 获取传递过来的参数对象
        this.webviewController.loadUrl(params.toString());
    }
    build(){
        Column(){
            Text("Hello World")
            Web({ src: "www.baidu.com", controller: this.webviewController})
        }

    }
}