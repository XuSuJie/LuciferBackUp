//
//  HomePageViewController.h
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/4/24.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SCREEN_SIZE   [UIScreen mainScreen].bounds.size
@interface HomePageViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain) NSArray* array;
@property(nonatomic,retain)UITableView* table;
@end
