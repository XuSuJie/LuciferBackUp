//
//  LeftViewDemo.m
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/5/16.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "LeftViewDemo.h"

@interface LeftViewDemo ()

@end

@implementation LeftViewDemo
+(instancetype)sharedInstance{
    static LeftViewDemo* leftvc=nil;
    if (leftvc == nil) {
        leftvc= [[LeftViewDemo alloc]init];
    }
    return leftvc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIViewController* vc=[[UIViewController alloc]init];
    vc.view.frame=CGRectMake(0, 0, SCREEN_SIZE.width, 180);
    vc.view.backgroundColor=[UIColor lightGrayColor];
    //
    //    UIView* content=[[UIView alloc]initWithFrame:CGRectMake(0, 180, SCREEN_SIZE.width-80, 10)];
    //    content.backgroundColor=[UIColor whiteColor];
    //
    UIViewController* vc3=[[UIViewController alloc]init];
    vc3.view.frame=CGRectMake(0, SCREEN_SIZE.height-50, SCREEN_SIZE.width, 50);
    vc3.view.backgroundColor=[UIColor whiteColor];
    //
    UIView* content2=[[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_SIZE.height-55, SCREEN_SIZE.width, 5)];
    content2.backgroundColor=[UIColor whiteColor];
    //
    UIViewController* vc2=[[UIViewController alloc]init];
    vc2.view.backgroundColor=[UIColor whiteColor];
    vc2.view.frame=CGRectMake(0, 180, SCREEN_SIZE.width, SCREEN_SIZE.height-255);
    //
    MyTableViewController* table=[[MyTableViewController alloc]init];
    table.view.backgroundColor=[UIColor whiteColor];
    table.view.frame=CGRectMake(0, 0, SCREEN_SIZE.width, 44*6);
    //table.sidemenu=_sidemenu;
    [vc2 addChildViewController:table];
    [vc2.view addSubview:table.view];
    //
    [self addChildViewController:vc];
    [self addChildViewController:vc2];
    [self addChildViewController:vc3];
    [self.view addSubview:vc.view];
    // [self.view addSubview:content];
    [self.view addSubview:vc2.view];
    [self.view addSubview:content2];
    [self.view addSubview:vc3.view];
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
