//
//  MainViewController.m
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/5/2.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "TableViewInsideViewController.h"

@interface TableViewInsideViewController ()
@property NSString* Title;
@end

@implementation TableViewInsideViewController
//
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    NSString* backTitle=[NSString stringWithFormat:@"<%@",_Title];
    //自定义导航栏
    UINavigationBar* naviBar=[[UINavigationBar alloc]initWithFrame:CGRectMake(0, 10, [UIScreen mainScreen].bounds.size.width , 44) ];
    naviBar.barTintColor=[UIColor whiteColor];
    UINavigationItem* item=[[UINavigationItem alloc]init];
    UIBarButtonItem* leftBtn=[[UIBarButtonItem alloc]initWithTitle:backTitle style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    leftBtn.tintColor=[UIColor blueColor];
    [item setLeftBarButtonItem:leftBtn];
    [naviBar pushNavigationItem:item animated:NO];
    [self.view addSubview:naviBar];
}
-(void)back{
    //模拟pop动画
    CATransition* animation=[CATransition animation];
    animation.duration=0.35;
    animation.type=kCATransitionPush;
    animation.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.subtype=kCATransitionFromLeft;
    [self.view.window.layer addAnimation:animation forKey:nil];
    [self dismissViewControllerAnimated:NO completion:nil];
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
