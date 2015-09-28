//
//  ViewController.m
//  5MiaoSDKDemo
//
//  Created by Column on 9/22/15.
//  Copyright © 2015 5miao. All rights reserved.
//

#import "AccountViewController.h"
#import "MainViewController.h"
#import "WebViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onWebButtonClicked:(id)sender {
    WebViewController *webViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"webView"];
    [self.navigationController pushViewController:webViewController animated:YES];
}

- (IBAction)onAccountButtonClicked:(id)sender {
    AccountViewController *accountViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"accountView"];
    [self.navigationController pushViewController:accountViewController animated:YES];
}

@end
