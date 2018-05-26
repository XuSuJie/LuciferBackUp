//
//  AddSpaceView.m
//  test
//
//  Created by 徐溯杰 on 2018/4/19.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "AddSpaceView.h"

@implementation AddSpaceView
@synthesize parentView;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithParentView:(UIView *)_parentView
{
    self = [super initWithFrame:_parentView.frame];
    if (self) {
        parentView = _parentView;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneTap)];
        tap.delegate = self;
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isKindOfClass:[UIButton class]]){
        return NO;
    }
    return YES;
}

-(void)show
{
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    
    [parentView addSubview:self];
    
    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4f];
                     }
                     completion:NULL
     ];
}

- (void)close
{
    [UIView animateWithDuration:0.0f delay:0.0 options:UIViewAnimationOptionTransitionNone
                     animations:^{
                         self.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.0f];
                     }
                     completion:^(BOOL finished) {
                         //                         for (UIView *v in [self subviews]) {
                         //                             [v removeFromSuperview];
                         //                         }
                         [self removeFromSuperview];
                     }
     ];
}

- (void)oneTap
{
    //[delegate closeAddSpaceView:self];
}

- (void)closeAddSpaceView: (AddSpaceView *)addSpaceView
{
    [self close];
}
@end
