//
//  AbilityViewController.m
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/5/18.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "AbilityViewController.h"

@interface AbilityViewController ()

@end

@implementation AbilityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"能力测评";
    UIButton* btn=[UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame=CGRectMake(50, SCREEN_SIZE.height/2-25, SCREEN_SIZE.width-100, 50);
    btn.titleLabel.textColor=[UIColor whiteColor];
    btn.backgroundColor=[UIColor cyanColor];
    [btn setTitle:@"开始能测" forState:UIControlStateNormal];
    btn.layer.masksToBounds=YES;
    btn.layer.cornerRadius=10;
    [btn addTarget:self action:@selector(EntryTest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)EntryTest{
    AbilityTableViewController* tableView=[[AbilityTableViewController alloc]init];
    [self.navigationController pushViewController:tableView animated:YES];
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
