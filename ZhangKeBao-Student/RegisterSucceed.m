//
//  RegisterSucceed.m
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/4/22.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "RegisterSucceed.h"

@implementation RegisterSucceed

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    //标题
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width/2-45, 25, 90, 24)];
    [label setFont:[UIFont systemFontOfSize:20.0]];
    [label setText:@"完成注册"];
    [label setTextColor:[UIColor blackColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:label];
    //上一页
    _prebtn=[[UIButton alloc]initWithFrame:CGRectMake( 10, 10, 50, 50)];
    [_prebtn setImage:[UIImage imageNamed:@"Next_22px.png"] forState:UIControlStateNormal];
    [_prebtn setBackgroundColor:[UIColor blueColor]];
    [_prebtn addTarget:self action:@selector(prepage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_prebtn];
    //画圆弧
   // [self.view addSubview:[UIBezierPath bezierPathWithArcCenter:CGPointMake(SCREEN_SIZE.width/2, SCREEN_SIZE.height/2) radius:50.0 startAngle:0.0 endAngle:M_PI_4*3 clockwise:YES]];
}
-(void)prepage{
    [self.view removeFromSuperview];
    [self.parentViewController.view addSubview:self.parentViewController.childViewControllers[1].view];
}
//控制器即将显示时
- (void)viewWillAppear:(BOOL)animated{
        [_button setBackgroundColor:[UIColor blueColor]];
}
//控制器消失
- (void)viewDidDisappear:(BOOL)animated{
        [_button setBackgroundColor:[UIColor grayColor]];
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
