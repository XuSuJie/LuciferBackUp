//
//  AppDelegate.h
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/4/20.
//  Copyright © 2018年 fjnu. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "ViewController.h"
#import "LoginedUser.h"
#import "ApplicaionAppend.h"
#import "LeftViewDemo.h"
#define SCREEN_SIZE   [UIScreen mainScreen].bounds.size
#define TABBAR_HEIGHT [[UITabBarController alloc]init].tabBar.frame.size.height
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow* window;
@end

