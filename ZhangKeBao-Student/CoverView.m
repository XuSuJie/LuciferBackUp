//
//  CoverView.m
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/5/16.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "CoverView.h"
#import "ApplicaionAppend.h"
@implementation CoverView
- (instancetype)init {
    self = [super init];
    if (self) {
        ApplicaionAppend *tabbar = [ApplicaionAppend sharedInstance];
        self.backgroundColor = [UIColor grayColor];
        self.frame = CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height);
        self.alpha = 0;
        self.userInteractionEnabled = YES;
        [tabbar.view addSubview:self];
        //点击收回侧边栏
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
        [self addGestureRecognizer:tap];
        //滑动收回侧边栏
        UISwipeGestureRecognizer* swipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
        swipe.direction=UISwipeGestureRecognizerDirectionLeft;
        [self addGestureRecognizer:swipe];
    }
    return self;
}
- (void)tapClick {
    ApplicaionAppend *tabbar = [ApplicaionAppend sharedInstance];
    LeftViewDemo* leftvc=[LeftViewDemo sharedInstance];
    [UIView animateWithDuration:0.2 animations:^{
        tabbar.view.frame = CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height);
        leftvc.view.frame = CGRectMake(-SCREEN_SIZE.width*3/4+50, 0, SCREEN_SIZE.width*3/4, SCREEN_SIZE.height);
        self.alpha = 0;
    }];
}
@end
