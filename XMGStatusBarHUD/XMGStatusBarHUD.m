//
//  XMGStatusBarHUD.m
//  XMGStatusBarHUD
//
//  Created by love on 16/5/26.
//  Copyright © 2016年 XMG. All rights reserved.
//

#import "XMGStatusBarHUD.h"
//全局的窗口
static UIWindow *window_;
//全局的定时器
static NSTimer *timer_;
//动画时长
static CGFloat const XMGMessageDuration = 2;
static CGFloat const XMGStatusBarHUDHeight = 20;
@implementation XMGStatusBarHUD
+ (void)showSuccess:(NSString *)string
{
    [self showMessage:string image:[UIImage imageNamed:@"XMGStatusBarHUD.bundle/success"]];
}

+ (void)showError:(NSString *)string
{
    [self showMessage:string image:[UIImage imageNamed:@"XMGStatusBarHUD.bundle/error"]];

}

+ (void)showLoading:(NSString *)string
{
    //停止定时器
    [timer_ invalidate];
    timer_ = nil;
    window_ = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, XMGStatusBarHUDHeight)];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelStatusBar;
    window_.hidden = NO;

    UILabel *label = [[UILabel alloc]init];
    label.frame = window_.bounds;
    [label setText:string];
    [label setFont:[UIFont systemFontOfSize:12]];
    [label setTextColor:[UIColor whiteColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    CGFloat width = [string sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}].width;
    CGFloat centerX = (window_.frame.size.width - width) * 0.5;
    indicator.center = CGPointMake(centerX-20, window_.frame.size.height * 0.5);
    [indicator startAnimating];
    [window_ addSubview:indicator];
    
    [window_ addSubview:label];
}

+ (void)hide
{
    window_ = nil;
}

+ (void)showMessage:(NSString *)string
{
    [self showMessage:string image:nil];
}

+ (void)showMessage:(NSString *)message image:(UIImage *)image
{
    //停止定时器
    [timer_ invalidate];
    //显示的动画
    CGFloat beginY = -XMGStatusBarHUDHeight;
    CGFloat endY = 0;
    window_ = [[UIWindow alloc]initWithFrame:CGRectMake(0, beginY, [UIScreen mainScreen].bounds.size.width, XMGStatusBarHUDHeight)];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelStatusBar;
    window_.hidden = NO;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = window_.bounds;
    [btn setTitle:message forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
    if (image) {
        [btn setImage:image forState:UIControlStateNormal];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    }
    [window_ addSubview:btn];
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = endY;
        window_.frame = frame;
    }];
    //两秒后执行隐藏动画
    timer_ = [NSTimer scheduledTimerWithTimeInterval:XMGMessageDuration target:self selector:@selector(hideAnimation) userInfo:nil repeats:nil];
}
+ (void)hideAnimation
{
    NSLog(@"111");
   [UIView animateWithDuration:0.5 delay:2 options:0 animations:^{
       CGRect frame = window_.frame;
       frame.origin.y = -XMGStatusBarHUDHeight;
       window_.frame = frame;

   } completion:nil];
    
}

@end
