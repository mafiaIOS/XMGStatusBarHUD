//
//  ViewController.m
//  XMGStatusBarHUD
//
//  Created by love on 16/5/26.
//  Copyright © 2016年 XMG. All rights reserved.
//

#import "ViewController.h"
#import "XMGStatusBarHUD.h"
@interface ViewController ()
- (IBAction)showSuccess;
- (IBAction)showError;
- (IBAction)showLoading;
- (IBAction)hide;
- (IBAction)showMessage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)showSuccess {
    [XMGStatusBarHUD showSuccess:@"发布成功!"];
}

- (IBAction)showError {
    [XMGStatusBarHUD showError:@"发布失败!"];
}

- (IBAction)showLoading {
    [XMGStatusBarHUD showLoading:@"正在加载中..."];
}

- (IBAction)hide {
    [XMGStatusBarHUD hide];
}

- (IBAction)showMessage {
    [XMGStatusBarHUD showMessage:@"做最简单易用的HUD"];
}
@end
