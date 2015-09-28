//
//  WebViewController.m
//  5MiaoSDKDemo
//
//  Created by Column on 9/22/15.
//  Copyright © 2015 5miao. All rights reserved.
//

#import "WebViewController.h"
#import "ThirdPartyForWuMiao.h"
#import "WMS5MiaoSDK.h"

@interface WebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController {
    id<WMSThirdParty> _thirdParty;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"5秒轻游戏";

    _thirdParty = [[ThirdPartyForWuMiao alloc] initWithWebViewController:self];
    [WMS5MiaoSDK loadSite:self.webView withThirdParty:_thirdParty];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)backButtonClicked:(id)sender {
    [self.webView goBack];
}

- (IBAction)forwardButtonClicked:(id)sender {
    [self.webView goForward];
}

- (IBAction)refreshButtonClicked:(id)sender {
    [self.webView reload];
}

- (void)viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self] == NSNotFound) {
        NSLog(@"Shutdown.");
        [WMS5MiaoSDK unloadSite];
        [_webView removeFromSuperview];
    }

    [super viewWillDisappear:animated];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
