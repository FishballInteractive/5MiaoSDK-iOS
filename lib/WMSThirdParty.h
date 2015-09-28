//
//  WMSThirdPartyAccount.h
//  5MiaoSDK
//
//  Created by Column on 9/20/15.
//  Copyright © 2015 5miao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WMSThirdParty <NSObject>

- (BOOL)isLoginSupported;

- (void)login;

- (NSDictionary *)getProfile;

- (BOOL)share:(NSDictionary *)shareInfo;

@end

@interface WMSDefaultThirdParty : NSObject<WMSThirdParty>

@end