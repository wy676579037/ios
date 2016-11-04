//
//  NewFeatureViewController.m
//  access
//
//  Created by 王勇 on 15/8/20.
//  Copyright (c) 2015年 王勇. All rights reserved.
//

#import "NewFeatureViewController.h"
#import "UIView+NewFeature.h"

// RGB颜色
#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

//Global frames
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height


#define NewfeatureCount 2

@interface NewFeatureViewController ()<UIScrollViewDelegate>

@property (nonatomic, weak) UIPageControl *pageControl;

@property (nonatomic, weak) UIScrollView *scrollView;

@end

@implementation NewFeatureViewController


+(void)switchRootViewController:(UIWindow *)window with:(UIViewController *)rootVC
{
    NSString *key = @"CFBundleVersion";
    // 上一次的使用版本（存储在沙盒中的版本号）
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    // 当前软件的版本号（从Info.plist中获得）
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
    if ([currentVersion isEqualToString:lastVersion]) { // 版本号相同：这次打开和上次打开的是同一
        window.rootViewController = rootVC;
    } else { // 这次打开的版本和上一次不一样，显示新特性
        NewFeatureViewController *newFuture = [[NewFeatureViewController alloc] init];
        newFuture.rootVc  =rootVC;
        window.rootViewController = newFuture;
        // 将当前的版本号存进沙盒
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:YES]; // 隐藏导航栏
    
    // 1.创建一个scrollView：显示所有的新特性图片
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    self.scrollView.contentMode=UIViewContentModeScaleAspectFill;
    
    // 2.添加图片到scrollView中
    CGFloat scrollW = scrollView.width;
    CGFloat scrollH = scrollView.height;
    for (int i = 0; i<NewfeatureCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.width = scrollW;
        imageView.height = scrollH;
        imageView.y = 0;
        imageView.x = i * scrollW;
        // 显示图片
        NSString *name = [NSString stringWithFormat:@"featureImg.bundle/new_ferture_%d", i + 1];
        imageView.image = [UIImage imageNamed:name];
        [scrollView addSubview:imageView];
        
        // 如果是最后一个imageView，就往里面添加其他内容
        if (i == NewfeatureCount - 1) {
            [self setupLastImageView:imageView];
        }
    }
    
#warning 默认情况下，scrollView一创建出来，它里面可能就存在一些子控件了
#warning 就算不主动添加子控件到scrollView中，scrollView内部还是可能会有一些子控件
    
    // 3.设置scrollView的其他属性
    // 如果想要某个方向上不能滚动，那么这个方向对应的尺寸数值传0即可
    scrollView.contentSize = CGSizeMake(NewfeatureCount * scrollW, 0);
    scrollView.bounces = NO; // 去除弹簧效果
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    
    // 4.添加pageControl：分页，展示目前看的是第几页
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = NewfeatureCount;
    pageControl.backgroundColor = [UIColor redColor];
    pageControl.currentPageIndicatorTintColor = RGBColor(253, 98, 42);
    pageControl.pageIndicatorTintColor = RGBColor(189, 189, 189);
    pageControl.centerX = scrollW * 0.5;
    pageControl.centerY = scrollH - 20;
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
    
    // UIPageControl就算没有设置尺寸，里面的内容还是照常显示的
    //    pageControl.width = 100;
    //    pageControl.height = 50;
    //    pageControl.userInteractionEnabled = NO;
    
    //    UITextField *text = [[UITextField alloc] init];
    //    text.frame = CGRectMake(10, 20, 100, 50);
    //    text.borderStyle = UITextBorderStyleRoundedRect;
    //    [self.view addSubview:text];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double page = scrollView.contentOffset.x / scrollView.width;
    // 四舍五入计算出页码
    self.pageControl.currentPage = (int)(page + 0.5);
    // 1.3四舍五入 1.3 + 0.5 = 1.8 强转为整数(int)1.8= 1
    // 1.5四舍五入 1.5 + 0.5 = 2.0 强转为整数(int)2.0= 2
    // 1.6四舍五入 1.6 + 0.5 = 2.1 强转为整数(int)2.1= 2
    // 0.7四舍五入 0.7 + 0.5 = 1.2 强转为整数(int)1.2= 1
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

/**
 *  初始化最后一个imageView
 *
 *  @param imageView 最后一个imageView
 */
- (void)setupLastImageView:(UIImageView *)imageView
{
    // 开启交互功能
    imageView.userInteractionEnabled = YES;
    
    UIButton *startBtn = [[UIButton alloc] init];

    [startBtn setBackgroundImage:[UIImage imageNamed:@"featureImg.bundle/new_feature_finish_button"] forState:UIControlStateNormal];
//    [startBtn setBackgroundImage:[UIImage imageNamed:@"featureImg.bundle/new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    startBtn.size = startBtn.currentBackgroundImage.size;
    startBtn.centerX = imageView.width * 0.5;
    startBtn.centerY = imageView.height * 0.9;
//    [startBtn setTitle:@"开始体验" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startBtn];
}

- (void)shareClick:(UIButton *)shareBtn
{
    // 状态取反
    shareBtn.selected = !shareBtn.isSelected;
}

- (void)startClick
{
    
    if (self.option) {
        self.option(self);
    }else{
        if (self.rootVc) {
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            window.rootViewController = self.rootVc;
        }
    }
        
}

- (void)dealloc
{
    
}



-(BOOL)prefersStatusBarHidden{
    return YES;
}



@end
