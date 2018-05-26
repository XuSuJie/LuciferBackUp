//
//  AddSpaceView.h
//  test
//
//  Created by 徐溯杰 on 2018/4/19.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AddSpaceView :UIView<UIGestureRecognizerDelegate>
{
    UIView *parentView;
}
@property (nonatomic, strong) UIView *parentView;
@property (nonatomic, assign) id delegate;

- (id)initWithParentView:(UIView *)_parentView;
- (void)show;
- (void)close;
@end
