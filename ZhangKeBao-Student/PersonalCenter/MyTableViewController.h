//
//  MyTableViewController.h
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/4/30.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewInsideViewController.h"
@interface MyTableViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>
@property CATransition* animation;
@end
