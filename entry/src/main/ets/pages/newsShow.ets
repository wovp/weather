import web_webview from '@ohos.web.webview';
import router from '@ohos.router';
@Entry
@Component
struct NewsShow {
    @State webviewController: web_webview.WebviewController = new web_webview.WebviewController();
    @State lili: string = "https://www.163.com/dy/article/IKN9RN9O053469LG.html"
    aboutToAppear(){
        const params = router.getParams(); // 获取传递过来的参数对象
        this.lili = params["nnn"]
        // this.lili = this.lili.replace(".html", "");
        try {
            //需要加载的URL是string类型
            this.webviewController.loadUrl(this.lili);
        } catch (error) {
            console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
        }
    }
    onPageShow(){
        const params = router.getParams(); // 获取传递过来的参数对象
        this.lili = params["nnn"]
        // this.lili = this.lili.replace(".html", "");
        try {
            //需要加载的URL是string类型
            this.webviewController.loadUrl(this.lili);
        } catch (error) {
            console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
        }

    }
    build(){
        Column(){
            Text("Hello World")
            Web({ src: this.lili, controller: this.webviewController})

        }

    }
}