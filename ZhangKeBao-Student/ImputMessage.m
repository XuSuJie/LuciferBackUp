//
//  ImputMessage.m
//  CocoaPodsTest
//
//  Created by 徐溯杰 on 2018/4/20.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "ImputMessage.h"

@interface ImputMessage ()

@end

@implementation ImputMessage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    _view1=[[UIViewController alloc]init];
    _view2=[[UIViewController alloc]init];
    _view3=[[UIViewController alloc]init];
    UIButton* button1=[[UIButton alloc]initWithFrame:CGRectMake(30, 50, 60, 40)];
    [button1 setTitle:@"button1" forState:UIControlStateNormal];
    UIButton* button2=[[UIButton alloc]initWithFrame:CGRectMake(100, 50, 60, 40)];
    [button2 setTitle:@"button2" forState:UIControlStateNormal];
    UIButton* button3=[[UIButton alloc]initWithFrame:CGRectMake(180, 50, 60, 40)];
    [button3 setTitle:@"button3" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(showview1) forControlEvents:UIControlEventTouchUpInside];
    [button2 addTarget:self action:@selector(showview2) forControlEvents:UIControlEventTouchUpInside];
    [button3 addTarget:self action:@selector(showview3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    [self.view addSubview:button3];
    [self addChildViewController:_view1];
    [self addChildViewController:_view2];
    [self addChildViewController:_view3];
}
-(void)showview1{
    [self presentViewController:_view1 animated:YES completion:nil];
}
-(void)showview2{
    [self presentViewController:_view2 animated:YES completion:nil];
}
-(void)showview3{
    [self presentViewController:_view3 animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
