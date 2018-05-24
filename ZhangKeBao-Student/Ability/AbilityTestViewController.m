//
//  AbilityTestViewController.m
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/5/2.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "AbilityTestViewController.h"

@interface AbilityTestViewController ()
@property NSArray* array;
@end

@implementation AbilityTestViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        _array=@[@"",@"" ];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(50, 90, 50, 40)];
    label.text=@"测试简介";
    [self.view addSubview:label];
    _btn=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width/2-100, 350,200, 50)];
    _btn.titleLabel.text=@"开始测试";
    [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _btn.backgroundColor=[UIColor blueColor];
    [_btn addTarget:self action:@selector(TestBegin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
}
-(void)TestBegin:(UIButton*)btn{
    TestScrollView* vc=[[TestScrollView alloc]init];
    vc.view.backgroundColor=[UIColor blackColor];
    vc.navigationItem.title=self.navigationItem.title;
    [self.navigationController pushViewController:vc animated:YES];
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
