//
//  TestViewController.m
//  test
//
//  Created by 徐溯杰 on 2018/4/24.
//  Copyright © 2018年 fjnu. All rights reserved.
//
#import"ViewController.h"
#import "HomepageViewController.h"

@implementation HomepageViewController
static NSString * const ID = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.title=@"首页";//导航栏标题
    MyCollectionViewFlowLayout* layout=[[MyCollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(self.view.frame.size.width-200, self.view.frame.size.height-350);
    // 创建collection 设置尺寸
    CGFloat collectionW = self.view.frame.size.width-100;
    CGFloat collectionH = self.view.frame.size.height-250;
    CGFloat collectionX = 50;
    CGFloat collectionY = 80;
    CGRect frame = CGRectMake(collectionX, collectionY, collectionW, collectionH);
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    collectionView.backgroundColor =[UIColor whiteColor];// [UIColor colorWithRed:68/255.0 green:83/255.0 blue:244/255.0 alpha:1.0];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    // 注册cell
    [collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:ID];
    //菜单按钮
    UIBarButtonItem* leftbtn=[[UIBarButtonItem alloc]initWithTitle:@"菜单" style:UIBarButtonItemStylePlain target:self action:@selector(showLeft)];
    self.navigationItem.leftBarButtonItem=leftbtn;
    //签到按钮
    UIBarButtonItem* rightbtn=[[UIBarButtonItem alloc]initWithTitle:@"签到" style:UIBarButtonItemStylePlain target:self action:@selector(showLeft)];
    self.navigationItem.rightBarButtonItem=rightbtn;
    //设置侧边栏
    UITableViewController* leftViewController=[[UITableViewController alloc]init];
    leftViewController.view.backgroundColor=[UIColor whiteColor];
    [_sidemenu setLeftViewController:leftViewController];
    //配置侧边栏宽度和动画
    _sidemenu.leftViewWidth = SCREEN_SIZE.width-100;
    _sidemenu.leftViewPresentationStyle = LGSideMenuPresentationStyleSlideAbove;
    _sidemenu.title=@"首页";//标签栏的标题
    _sidemenu.tabBarItem.image=[UIImage imageNamed:@"Next_22px"];//标签栏的icon
}
-(void)showLeft{
    [_sidemenu showLeftViewAnimated];
    //动画配置
//    CATransition* transition= [CATransition animation];
//    transition.type=kCATransitionMoveIn;
//    transition.subtype=kCATransitionFromLeft;
//    transition.duration=0.3;
//    [self.view.window.layer removeAllAnimations];
//    [self.view.window.layer addAnimation:transition forKey:nil];
    //转场方式
//    vc.modalPresentationStyle=UIModalPresentationCustom;

//    self.definesPresentationContext=YES;设置背景
//    [self presentViewController:vc animated:NO completion:nil];
    //vc.view.superview.backgroundColor=[UIColor clearColor];
}
//配置cell
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.imageName = [NSString stringWithFormat:@"%zd", indexPath.item + 1];
    return cell;
}
//设定cell的数量
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}
-(void)viewWillAppear:(BOOL)animated{
    //    if (self.presentedViewController!=nil) {
    //        _loading=[[LoadingView alloc]init];
    //        [_loading show];
    //    }
}
-(void)viewWillDisappear:(BOOL)animated{
    //    [_loading disappear];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
