//
//  XMGStatusBarHUD.h
//  XMGStatusBarHUD
//
//  Created by love on 16/5/26.
//  Copyright © 2016年 XMG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMGStatusBarHUD : NSObject
/**
 * 显示成功
 */
+ (void)showSuccess:(NSString *)string;

/**
 *显示失败
 */
+ (void)showError:(NSString *)string;

/**
 *显示正在处理信息
 */
+ (void)showLoading:(NSString *)string;

/**
 *  隐藏
 */
+ (void)hide;

/**
 *  显示普通的提示信息
 */
+ (void)showMessage:(NSString *)string;
@end
