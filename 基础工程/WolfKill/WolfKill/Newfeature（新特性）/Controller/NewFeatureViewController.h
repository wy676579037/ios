//
//  NewFeatureViewController.h
//  access
//
//  Created by 王勇 on 15/8/20.
//  Copyright (c) 2015年 王勇. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^StartClickOption)(UIViewController *vc);




@interface NewFeatureViewController : UIViewController

+(void)switchRootViewController:(UIWindow *)window with:(UIViewController *)rootVC;

@property(nonatomic,copy) StartClickOption option;


@property(nonatomic,strong) UIViewController *rootVc;



@end
