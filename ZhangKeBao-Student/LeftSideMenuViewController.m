//
//  LeftSideMenuViewController.m
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/4/30.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "LeftSideMenuViewController.h"
@implementation LeftSideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIViewController* contentvc=[[UIViewController alloc]init];
    contentvc.view.frame=CGRectMake(SCREEN_SIZE.width-80, 0, 80, SCREEN_SIZE.height);
    contentvc.view.backgroundColor=[UIColor colorWithWhite:0 alpha:0.5];
    UITapGestureRecognizer* tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(isPointAtArea:)];
    tap.numberOfTapsRequired=1;
    tap.numberOfTouchesRequired=1;
    [contentvc.view addGestureRecognizer:tap];
    //
    UIViewController* vc=[[UIViewController alloc]init];
    vc.view.frame=CGRectMake(0, 0, SCREEN_SIZE.width-80, 200);
    vc.view.backgroundColor=[UIColor whiteColor];
    //
    UITableViewController* table=[[UITableViewController alloc]init];
    table.view.backgroundColor=[UIColor whiteColor];
    table.view.frame=CGRectMake(0, 210, SCREEN_SIZE.width-80, SCREEN_SIZE.height-300);
    //
    UIViewController* vc2=[[UIViewController alloc]init];
    vc2.view.frame=CGRectMake(0, SCREEN_SIZE.height-50, SCREEN_SIZE.width-80, 50);
    vc2.view.backgroundColor=[UIColor whiteColor];
    [self addChildViewController:vc];
    [self addChildViewController:table];
    [self addChildViewController:vc2];
    [self addChildViewController:contentvc];
    [self.view addSubview:vc.view];
    [self.view addSubview:table.view];
    [self.view addSubview:vc2.view];
    [self.view addSubview:contentvc.view];
    //vc2.edgesForExtendedLayout=UIRectEdgeTop;
}
-(void)isPointAtArea:(UITapGestureRecognizer*)sender{
    NSLog(@"tap leftside");
    if(/*[sender locationInView:self.view].x>SCREEN_SIZE.width &&*/ _sidemenu.isLeftViewShowing)
        [self dismissLeft];
}
-(void)dismissLeft{
    //_sidemenu.tabBarController.tabBar.hidden=NO;
    [_sidemenu hideLeftViewAnimated];
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
