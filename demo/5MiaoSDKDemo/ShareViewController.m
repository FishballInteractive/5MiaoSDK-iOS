//
//  ShareViewController.m
//  5MiaoSDKDemo
//
//  Created by Column on 9/28/15.
//  Copyright © 2015 5miao. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@property (weak, nonatomic) IBOutlet UITextView *shareContentTextView;
@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"分享";
    self.shareContentTextView.text = self.shareContent;
}

@end
