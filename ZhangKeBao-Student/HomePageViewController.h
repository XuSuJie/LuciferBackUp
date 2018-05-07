//
//  TestViewController.h
//  test
//
//  Created by 徐溯杰 on 2018/4/24.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftSideMenuViewController.h"
#import "NetWorkManager.h"
#import "LoginedUser.h"
#import "MyCollectionViewFlowLayout.h"
#import "MyCollectionViewCell.h"
#import <LGSideMenuController/LGSideMenuController.h>
#import <LGSideMenuController/UIViewController+LGSideMenuController.h>
@interface HomePageViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>
@property LGSideMenuController* sidemenu;
@property UIWindow* coverwindow;
@property LeftSideMenuViewController* leftViewController;
@end
