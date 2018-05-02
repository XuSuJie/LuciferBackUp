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
    UIView* view=[[UIView alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width-80, 0, 80, SCREEN_SIZE.height)];
    
    //点击收回侧边栏
    UITapGestureRecognizer* tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(isPointAtArea:)];
    tap.numberOfTapsRequired=1;
    tap.numberOfTouchesRequired=1;
    [view addGestureRecognizer:tap];
    //滑动收回侧边栏
    UISwipeGestureRecognizer* swipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(dismissLeft)];
    swipe.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipe];
    //
    UIViewController* vc=[[UIViewController alloc]init];
    vc.view.frame=CGRectMake(0, 0, SCREEN_SIZE.width-80, 180);
    vc.view.backgroundColor=[UIColor lightGrayColor];
    //
//    UIView* content=[[UIView alloc]initWithFrame:CGRectMake(0, 180, SCREEN_SIZE.width-80, 10)];
//    content.backgroundColor=[UIColor whiteColor];
    //
    UIViewController* vc2=[[UIViewController alloc]init];
    vc2.view.frame=CGRectMake(0, SCREEN_SIZE.height-50, SCREEN_SIZE.width-80, 50);
    vc2.view.backgroundColor=[UIColor whiteColor];
    //
    UIView* content2=[[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_SIZE.height-55, SCREEN_SIZE.width-80, 5)];
    content2.backgroundColor=[UIColor whiteColor];
    //
    MyTableViewController* table=[[MyTableViewController alloc]init];
    table.view.backgroundColor=[UIColor whiteColor];
    table.view.frame=CGRectMake(0, 180, SCREEN_SIZE.width-80, SCREEN_SIZE.height-255);
    table.sidemenu=_sidemenu;
    //
    [self addChildViewController:vc];
    [self addChildViewController:table];
    [self addChildViewController:vc2];
    [self.view addSubview:vc.view];
   // [self.view addSubview:content];
    [self.view addSubview:table.view];
    [self.view addSubview:content2];
    [self.view addSubview:vc2.view];
    [self.view addSubview:view];
    //[self.view addSubview:contentvc.view];
    //vc2.edgesForExtendedLayout=UIRectEdgeTop;
}
-(void)isPointAtArea:(UITapGestureRecognizer*)sender{
    if([sender locationInView:self.view].x>=SCREEN_SIZE.width-80 && _sidemenu.isLeftViewShowing)
        [self dismissLeft];
}
-(void)dismissLeft{
    [_sidemenu hideLeftViewAnimated:YES completionHandler:^{self->_sidemenu.tabBarController.tabBar.hidden=NO;}];
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    // 若为UITableViewCellContentView（即点击了tableViewCell），则不截获Touch事件(只解除的是cell与手势间的冲突，cell以外仍然响应手势)
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]){
        return NO;
    }
    // 若为UITableView（即点击了tableView任意区域），则不截获Touch事件(完全解除tableView与手势间的冲突，cell以外也不会再响应手势)
    if ([touch.view isKindOfClass:[MyTableViewController class]]){
        return NO;
    }
    return YES;
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
