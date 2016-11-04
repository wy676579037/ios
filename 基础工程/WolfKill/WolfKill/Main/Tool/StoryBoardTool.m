//
//  StoryBoardTool.m
//  hc96871
//
//  Created by 王勇 on 15/9/8.
//  Copyright (c) 2015年 HC. All rights reserved.
//

#import "StoryBoardTool.h"


@implementation StoryBoardTool

+(id)getViewController:(NSString *)storyboardName{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController * vc =   storyboard.instantiateInitialViewController;
    return vc;
}


+(id)getViewController:(NSString *)storyboardName andIdentifier:(NSString *)identifier{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:identifier];
    return vc;
}








@end
