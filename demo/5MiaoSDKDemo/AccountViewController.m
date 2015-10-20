//
//  AccountViewController.m
//  5MiaoSDKDemo
//
//  Created by Column on 9/22/15.
//  Copyright © 2015 5miao. All rights reserved.
//

#import <WMS5MiaoSDK/WMS5MiaoSDK.h>

#import "AccountViewController.h"

static NSString *const kKeyUserDefaults = @"5MiaoDemo.UserDefaults";
static NSString *const kKeyUid    = @"uid";
static NSString *const kKeyName   = @"name";
static NSString *const kKeyAvator = @"avator";

@interface AccountViewController ()

@property (weak, nonatomic) IBOutlet UIStackView *loginView;
@property (weak, nonatomic) IBOutlet UITextField *idTextInLoginView;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextInLoginView;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (weak, nonatomic) IBOutlet UIStackView *logoutView;
@property (weak, nonatomic) IBOutlet UILabel *idLabelInLogoutView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabbelInLogoutView;
@property (weak, nonatomic) IBOutlet UILabel *avatorLabelInLogoutView;

- (void)wms_refreshViews;

@end

@implementation AccountViewController {
    BOOL _tryLogin;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _tryLogin = NO;
    self.navigationItem.title = @"帐号";
    [self wms_refreshViews];
}

- (void)wms_refreshViews {
    NSDictionary *userDefaults = [[NSUserDefaults standardUserDefaults] dictionaryForKey:kKeyUserDefaults];
    NSString *uid = [userDefaults objectForKey:kKeyUid];
    if (uid == nil) {
        self.loginView.hidden = NO;
        self.logoutView.hidden = YES;

        self.idTextInLoginView.text = @"10000001";
        self.passwordTextInLoginView.text = @"123456";
    } else {
        self.loginView.hidden = YES;
        self.logoutView.hidden = NO;

        self.idLabelInLogoutView.text = [userDefaults objectForKey:kKeyUid];
        self.nameLabbelInLogoutView.text = [userDefaults objectForKey:kKeyName];
        self.avatorLabelInLogoutView.text = [userDefaults objectForKey:kKeyAvator];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLoginButtonClicked:(id)sender {
    _tryLogin = YES;

    NSDictionary *profile = @{
                              kKeyUid : @"10000001",
                              kKeyName : @"召云",
                              kKeyAvator : @"http://www.qq745.com/uploads/allimg/141012/1-141012103335-50.jpg"
                              };
    [[NSUserDefaults standardUserDefaults] setObject:profile forKey:kKeyUserDefaults];

    [self wms_refreshViews];
    [self.navigationController popViewControllerAnimated:YES];

    [WMS5MiaoSDK notifyLoginResult:WMSLoginSuccess withReason:@"Success"];
}

- (IBAction)onLogoutButtonClicked:(id)sender {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kKeyUserDefaults];

    [self wms_refreshViews];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
    if (!_tryLogin) {
        [WMS5MiaoSDK notifyLoginResult:WMSLoginCancelled withReason:@"Cancelled."];
    }
    [super viewDidDisappear:animated];
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
