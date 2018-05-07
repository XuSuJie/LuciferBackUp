//
//  LoadingView.m
//  CocoaPodsTest
//
//  Created by 徐溯杰 on 2018/4/20.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "LoadingView.h"

@implementation LoadingView
-(void)show{
    [self setBackgroundColor:[UIColor grayColor]];
    [self setCenter:CGPointMake(SCREEN_SIZE.width/2, SCREEN_SIZE.height/2)];
    [self startAnimating];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    _addSpaceView = [[AddSpaceView alloc] initWithParentView:window.rootViewController.view];
    [self backgroundToDark:_addSpaceView];
}
-(void)disappear{
    [self stopAnimating];
    [_addSpaceView close];
}
-(void)backgroundToDark:(AddSpaceView*)addSpaceView{
    self.inputView.layer.cornerRadius = 12;
    self.inputView.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    self.inputView.center = addSpaceView.center;
    [addSpaceView setDelegate:self];
    [addSpaceView addSubview:self.inputView];
    [addSpaceView show];
}
@end
