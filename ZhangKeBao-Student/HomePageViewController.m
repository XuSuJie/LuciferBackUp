//
//  HomePageViewController.m
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/4/24.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "HomePageViewController.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.tabBarItem.image=[UIImage imageNamed:@"tab_recent_nor"];
    self.navigationItem.title=@"首页";
    UIBarButtonItem* right=[[UIBarButtonItem alloc]initWithTitle:@"签到" style:UIBarButtonItemStylePlain target:self action:@selector(push:)];
    self.navigationItem.rightBarButtonItem=right;
    UISwipeGestureRecognizer* swipe =[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAction)];
    swipe.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipe];
    _table=[[UITableView alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width/2-100, 200, 200, 200) style:UITableViewStylePlain];
    _table.delegate=self;
    [self.view addSubview:_table];
}
-(void)swipeAction{
    NSLog(@"swipe");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)push:(UIBarButtonItem *)sender {
//    _VC=[[UIViewController alloc] init];
//    _VC.view.backgroundColor=[UIColor whiteColor];
//    [self.navigationController pushViewController:_VC animated:YES];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 0;
}


- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {

}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
}

- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    return CGSizeMake(0, 0);
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
    
}

- (void)setNeedsFocusUpdate {
    
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    return YES;
}

- (void)updateFocusIfNeeded {
    
}

@end
