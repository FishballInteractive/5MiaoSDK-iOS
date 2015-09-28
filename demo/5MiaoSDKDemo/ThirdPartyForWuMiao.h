//
//  WuMiaoThirdPartyAccount.h
//  5MiaoSDK
//
//  Created by Column on 9/22/15.
//  Copyright © 2015 5miao. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WMS5MiaoSDK.h"
#import "WebViewController.h"

@interface ThirdPartyForWuMiao : WMSDefaultThirdParty

- (instancetype)initWithWebViewController:(WebViewController *)controller;

@end