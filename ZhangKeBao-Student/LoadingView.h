//
//  LoadingView.h
//  CocoaPodsTest
//
//  Created by 徐溯杰 on 2018/4/20.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddSpaceView.h"
#define SCREEN_SIZE   [UIScreen mainScreen].bounds.size
@interface LoadingView : UIActivityIndicatorView
@property AddSpaceView* addSpaceView;
-(void)show;
-(void)disappear;
@end
