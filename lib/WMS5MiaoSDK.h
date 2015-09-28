//
//  WMS5MiaoSDK.h
//  5MiaoSDK
//
//  Created by Column on 9/20/15.
//  Copyright © 2015 5miao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "WMSThirdParty.h"

typedef NS_ENUM(NSUInteger, WMSLoginResult) {
    WMSLoginSuccess   = 1 << 0,
    WMSLoginFailure   = 1 << 1,
    WMSLoginCancelled = 1 << 2
};

@interface WMS5MiaoSDK : NSObject

+ (void)startWithAppId:(NSString *)appId
             andAppKey:(NSString *)appKey
            andChannel:(NSString *)channel;

+ (void)loadSite:(UIWebView *)webView
  withThirdParty:(id<WMSThirdParty>)thirdParty;

+ (void)unloadSite;

+ (void)notifyLoginResult:(WMSLoginResult)result
               withReason:(NSString *)reason;
@end