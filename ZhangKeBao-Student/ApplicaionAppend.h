//
//  ApplicaionAppend.h
//  CocoaPodsTest
//
//  Created by 徐溯杰 on 2018/4/20.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ViewController.h"
#import "HomePageViewController.h"
#define SCREEN_SIZE   [UIScreen mainScreen].bounds.size
#define TABBAR_HEIGHT [[UITabBarController alloc]init].tabBar.frame.size.height
@interface ApplicaionAppend : UITabBarController
@property(weak,nonatomic) UIViewController* vc;
@end
