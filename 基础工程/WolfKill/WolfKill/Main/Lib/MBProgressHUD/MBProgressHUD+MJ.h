//
//  MBProgressHUD+MJ.h
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (MJ)




+(void)showToast:(NSString *) msg toView:(UIView *)view;
+(void)showToast:(NSString *) msg;


+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view yOffset:(CGFloat)yoffset;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;
+ (MBProgressHUD *)showMessage:(NSString *)message;


+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;


+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end
