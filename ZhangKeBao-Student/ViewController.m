//
//  ViewController.m
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/4/20.
//  Copyright © 2018年 fjnu. All rights reserved.
//
#import "ViewController.h"
#import "LoginViewController.h"
@implementation ViewController
//控制器加载完毕
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的";
    self.button=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width/2-50, (SCREEN_SIZE.height-TABBAR_HEIGHT)/2-15, 100, 30)];
    [self.button setTitle:@"登录/注册" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(pushLogin:) forControlEvents:UIControlEventTouchUpInside];
    self.hidesBottomBarWhenPushed=NO;
    [self.view addSubview:self.button];
    
    //[button addTarget:self action:@selector(showLogin) forControlEvents:UIControlEventTouchUpInside];
    //[self.view addSubview:button];
}
//控制器即将显示时
- (void)viewWillAppear:(BOOL)animated{
}
//控制器完全显示
- (void)viewDidAppear:(BOOL)animated{
}
//控制器即将消失
- (void)viewWillDisappear:(BOOL)animated{
}
//控制器消失
- (void)viewDidDisappear:(BOOL)animated{
}
/*控制器即将销毁
 - (void)viewWillUnload{
 }*/
/*控制器完全销毁
 - (void)viewDidUnload{
 }*/
-(void)pushLogin:(id)sender{
    LoginViewController* v4=[[LoginViewController alloc]init];
    v4.title=@"登录界面";
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:v4 animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}
-(void)showLogin{
    LoginViewController* v4=[[LoginViewController alloc]init];
    [v4 setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:v4 animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
