//
//  ApplicaionAppend.h
//  CocoaPodsTest
//
//  Created by 徐溯杰 on 2018/4/20.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageViewController.h"
#import "AbilityViewController.h"
#import "LoginedUser.h"
#define SCREEN_SIZE   [UIScreen mainScreen].bounds.size
#define TABBAR_HEIGHT [[UITabBarController alloc]init].tabBar.frame.size.height
@interface ApplicaionAppend : UITabBarController
+(instancetype)sharedInstance;
@end
