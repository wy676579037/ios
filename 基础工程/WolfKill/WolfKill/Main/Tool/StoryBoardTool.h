//
//  StoryBoardTool.h
//  hc96871
//
//  Created by 王勇 on 15/9/8.
//  Copyright (c) 2015年 HC. All rights reserved.
//


#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>


@interface StoryBoardTool : NSObject

+(id)getViewController:(NSString *)storyboardName;


+(id)getViewController:(NSString *)storyboardName andIdentifier:(NSString *)identifier;


@end
