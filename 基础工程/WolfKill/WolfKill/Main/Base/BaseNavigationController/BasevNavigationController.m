//
//  BasevNavigationController.m
//  WolfKill
//
//  Created by wangyong on 2016/11/4.
//  Copyright © 2016年 wangyong. All rights reserved.
//

#import "BasevNavigationController.h"

#define ThemeColor [UIColor orangeColor]

#define TextColor [UIColor colorWithRed:(67)/255.0 green:(177)/255.0 blue:(73)/255.0 alpha:1.0]

@interface BasevNavigationController ()

@end

@implementation BasevNavigationController

+ (void)initialize
{
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.barTintColor = ThemeColor;
    
    //    navBar.clipsToBounds=YES;
    //字体大小、颜色
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIColor blackColor],
                                NSForegroundColorAttributeName, nil];
    [navBar setTitleTextAttributes:attributes];
    
    
    // 设置整个项目所有item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // 设置普通状态
    // key：NS****AttributeName
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = ThemeColor;
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置不可用状态
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.7];
    disableTextAttrs[NSFontAttributeName] = textAttrs[NSFontAttributeName];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}



/**
 *  重写这个方法目的：能够拦截所有push进来的控制器
 *
 *  @param viewController 即将push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;
        
        /* 设置导航栏上面的内容 */
        // 设置左边的返回按钮
        NSString *backImageName = [NSString stringWithFormat:@"baseNavImg.bundle/navigationbar_back"];
        
        NSString *backHignlightedImageName = [NSString stringWithFormat:@"baseNavImg.bundle/navigationbar_back_highlighted"];
        
        viewController.navigationItem.leftBarButtonItem = [self itemWithTarget:self action:@selector(back) image:backImageName highImage:backHignlightedImageName];
        
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    // 因为self本来就是一个导航控制器，self.navigationController这里是nil的
    [self popViewControllerAnimated:YES];
}

- (void)more
{
    [self popToRootViewControllerAnimated:YES];
}

- (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    // 设置尺寸
    CGRect frame = btn.frame;
    frame.size =btn.currentBackgroundImage.size;
    btn.frame = frame;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
