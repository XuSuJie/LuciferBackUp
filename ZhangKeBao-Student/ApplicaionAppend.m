//
//  ApplicaionAppend.m
//  CocoaPodsTest
//
//  Created by 徐溯杰 on 2018/4/20.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "ApplicaionAppend.h"
@interface ApplicaionAppend ()
@property LGSideMenuController* sidemenu;
@end

@implementation ApplicaionAppend

- (void)viewDidLoad {
    [super viewDidLoad];
    HomePageViewController* v1=[[HomePageViewController alloc]init];
    UINavigationController* nav1=[[UINavigationController alloc]initWithRootViewController:v1];
//    UITableViewController* leftViewController=[[UITableViewController alloc]init];
//    leftViewController.view.backgroundColor=[UIColor blueColor];
    _sidemenu=[LGSideMenuController sideMenuControllerWithRootViewController:nav1 leftViewController:nil rightViewController:nil];
    v1.sidemenu=_sidemenu;
    //v1.tabBarItem.badgeValue=@"123";
    
    UIViewController* v2=[[UIViewController alloc]init];
    UINavigationController* nav2 =[[UINavigationController alloc]initWithRootViewController:v2];
    nav2.hidesBottomBarWhenPushed=YES;
    nav2.view.backgroundColor=[UIColor whiteColor];
    nav2.title=@"题海测试";
    nav2.tabBarItem.image=[UIImage imageNamed:@"tab_buddy_nor"];
    UILabel* label2=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width/2-75, (SCREEN_SIZE.height-TABBAR_HEIGHT)/2-15, 150, 30)];
    label2.textAlignment=NSTextAlignmentCenter;
    [label2 setText:@"题海测试"];
    [nav2.view addSubview:label2];
    
    UIViewController* v3=[[UIViewController alloc]init];
    UINavigationController* nav3 =[[UINavigationController alloc]initWithRootViewController:v3];
    nav3.title=@"能力测试";
    nav3.view.backgroundColor=[UIColor whiteColor];
    nav3.tabBarItem.image=[UIImage imageNamed:@"tab_qworld_nor"];
    UILabel* label3=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width/2-75, (SCREEN_SIZE.height-TABBAR_HEIGHT)/2-15, 150, 30)];
    label3.textAlignment=NSTextAlignmentCenter;
    [label3 setText:@"这是能力测试界面"];
    [nav3.view addSubview:label3];
    
    UIViewController* v4=[[UIViewController alloc]init];
    UINavigationController* nav4 =[[UINavigationController alloc]initWithRootViewController:v4];
    nav4.title=@"选科";
    nav4.view.backgroundColor=[UIColor whiteColor];
    nav4.tabBarItem.image=[UIImage imageNamed:@"tab_qworld_nor"];
    UILabel* label4=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width/2-75, (SCREEN_SIZE.height-TABBAR_HEIGHT)/2-15, 150, 30)];
    label4.textAlignment=NSTextAlignmentCenter;
    [label4 setText:@"这是选科界面"];
    [nav4.view addSubview:label4];
    
    self.viewControllers=@[_sidemenu,nav2,nav3,nav4];
    self.tabBar.backgroundColor=[UIColor darkGrayColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
