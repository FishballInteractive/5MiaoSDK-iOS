//
//  WuMiaoThirdPartyAccount.m
//  5MiaoSDK
//
//  Created by Column on 9/22/15.
//  Copyright © 2015 5miao. All rights reserved.
//

#import "AccountViewController.h"
#import "ShareViewController.h"
#import "ThirdPartyForWuMiao.h"

static NSString *const kKeyUserDefaults = @"5MiaoDemo.UserDefaults";
static NSString *const kKeyUid    = @"uid";
static NSString *const kKeyName   = @"name";
static NSString *const kKeyAvator = @"avator";

@implementation ThirdPartyForWuMiao {
    WebViewController *_controller;
}

- (instancetype)initWithWebViewController:(WebViewController *)controller {
    self = [super init];
    _controller = controller;
    return self;
}

- (BOOL)isLoginSupported {
    return YES;
}

- (void)login {
    AccountViewController *accountViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"accountView"];
    [_controller.navigationController pushViewController:accountViewController animated:YES];
}

- (NSDictionary *)getProfile {
    NSDictionary *userDefaults = [[NSUserDefaults standardUserDefaults] dictionaryForKey:kKeyUserDefaults];
    if ([userDefaults objectForKey:kKeyUid] == nil) {
        return @{};
    }

    return @{
      @"uid" : [userDefaults objectForKey:kKeyUid],
     @"name" : [userDefaults objectForKey:kKeyName],
   @"avator" : [userDefaults objectForKey:kKeyAvator]
    };
}

- (BOOL)share:(NSDictionary *)shareInfo {
    ShareViewController *shareViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"shareView"];
    shareViewController.shareContent = [NSString stringWithFormat:@"%@", shareInfo];
    [_controller.navigationController pushViewController:shareViewController animated:YES];
    return YES;
}

@end
