//
//  TestScrollView.h
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/5/22.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTestView.h"
#import <RadioButton/RadioButton.h>
#define SCREEN_SIZE   [UIScreen mainScreen].bounds.size
@interface TestScrollView : UIViewController<UIScrollViewDelegate>
@property(strong,nonatomic)UIPageControl* pageControl;
@property(strong,nonatomic)UIScrollView * scrollView;
@property(strong,nonatomic)NSMutableArray* viewArray;

@end
