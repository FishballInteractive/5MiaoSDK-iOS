# 5秒SDK（iOS）接入说明文档

#### 1. 快速接入流程
* 只需4步，快速完成接入
![快速接入流程][quick-import]

#### 2. 接入指南
##### 2.1. 导入5秒轻游戏SDK静态库
  * 下载[5MiaoSDK静态库][static-lib];
  * 在Xcode中引入静态库，同时需要引入CoreTelephony.framework

##### 2.2. SDK初始化

调用初始化接口是调用其他接口的前置条件，否则调用其他接口将出错。  
初始化接口建议在程序入口处调用，例如：AppDelegate的application didFinishLaunchingWithOptions:里面  
接入的示例代码如下：

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [WMS5MiaoSDK startWithAppId:@"10000066"
                      andAppKey:@"984751bdb0f7f48d391b01a36bcbcbeb"
                     andChannel:@"yuwan01"];

    // Some code
    return YES;
}
```

##### 2.4. WebView载入“5秒轻游戏”网站

* 载入网站

```objective-c

// 在包含UIWebView的ViewController中载入5秒轻游戏
- (void)viewDidLoad {
    [super viewDidLoad];

    // 载入“5秒轻游戏”网站 - 情况1：采用默认配置
    WMSDefaultThirdParty *thirdParty = [[WMSDefaultThirdParty alloc] init];
    [WMS5MiaoSDK loadSite:self.webView withThirdParty:thirdParty];

    // 载入“5秒轻游戏”网站 - 情况2：根据合作商需求进行定制，如帐号绑定、游戏分享使用自带分享等。
    // 如何实现YourThirdParty见下述代码。
    YourThirdParty *thirdParty = [[YourThirdParty alloc] init];
    [WMS5MiaoSDK loadSite:self.webView withThirdParty:thirdParty];
}

// YourThirdParty实现范例
@interface YourThirdParty : WMSDefaultThirdParty

@end

@implementation YourThirdParty

// 查询是否支持调用合作商应用的登录页面，帐号绑定的前提。
- (BOOL)isLoginSupported {
    // 返回YES的情况下，请覆盖实现login和getProfile方法
    return YES;
}

// 调用第合作商应用的登录页面，前提是isLoginSupported返回true
// 注意：用户进行登录后，其结果请调用[WMS5MiaoSDK notifyLoginResult: withReason]通知SDK，以便刷新5秒轻游戏的登录状态
- (void)login {

}

// 获取合作商用户的个人信息，必须包含uid、name、avator（用户id、名称、头像地址）3个字段。
// 未登录情况下，返回null或空NSDictionary即可。
// 注意：合作商的用户登出账户后，请确认确保此处返回null或空NSDictionary。
- (NSDictionary *)getProfile {
    return nil;
}

// 分享。游戏内分享时，支持调用合作商的分享页面。如果支持请返回YES，并打开分享页面
- (BOOL)share:(NSDictionary *)shareInfo {
    return YES;
}

@end

```

* 退出网站

```objective-c
// 在包含UIWebView的UIViewController关闭时调用[WMS5MiaoSDK unloadSite]。
// 注意：请不要简单地在viewWillDisappear中调用，而是在UIViewController真正退出时调用（被登录页面、分享页面覆盖时需注意）
// 以在UINavigationController中子UIViewController为例，代码如下：
- (void)viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
        [WMS5MiaoSDK unloadSite];
        [_webView removeFromSuperview];

        // 另外注意将UIWebView移除
        [_webView removeFromSuperview];
    }

    [super viewWillDisappear:animated];
}


```

[quick-import]: README/quick-import.png "快速接入"
[static-lib]: https://github.com/FishballInteractive/5MiaoSDK-iOS/tree/master/lib/
