//
//UIView+Extension.h
//  access
//
//  Created by 王勇 on 15/8/20.
//  Copyright (c) 2015年 王勇. All rights reserved.
//

#import <UIKit/UIKit.h>


#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define ThemeColor [UIColor colorWithRed:(67)/255.0 green:(177)/255.0 blue:(73)/255.0 alpha:1.0]






@interface UIView (NewFeature)

-(void)removeAllSubView;

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

@end
