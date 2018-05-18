//
//  TestViewController.h
//  test
//
//  Created by 徐溯杰 on 2018/4/24.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoverView.h"
#import "NetWorkManager.h"
#import "LoginedUser.h"
#import "MyCollectionViewFlowLayout.h"
#import "MyCollectionViewCell.h"
#import "LeftViewDemo.h"

@interface HomePageViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>
@property CoverView* coverView;
@end
