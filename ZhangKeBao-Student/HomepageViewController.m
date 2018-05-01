//
//  TestViewController.m
//  test
//
//  Created by 徐溯杰 on 2018/4/24.
//  Copyright © 2018年 fjnu. All rights reserved.
//
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
    CGFloat collectionW = self.view.frame.size.width-150;
    CGFloat collectionH = self.view.frame.size.height-250;
    CGFloat collectionX = 75;
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
    _leftViewController=[[LeftSideMenuViewController alloc]init];
    [_sidemenu setLeftViewController:_leftViewController];
    //配置侧边栏宽度和动画
    _sidemenu.leftViewWidth = SCREEN_SIZE.width;
    _sidemenu.leftViewPresentationStyle = LGSideMenuPresentationStyleSlideAbove;
    _sidemenu.title=@"首页";//标签栏的标题
    _sidemenu.tabBarItem.image=[UIImage imageNamed:@"Next_22px"];//标签栏的icon
    //配置手势
    UISwipeGestureRecognizer* swipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(showLeft)];
    swipe.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
    UISwipeGestureRecognizer* swipe2=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(dismissLeft)];
    swipe2.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipe2];
    _leftViewController.sidemenu=_sidemenu;
    //添加遮盖屏
//    _coverwindow=[[UIWindow alloc]initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height)];
//    _coverwindow.backgroundColor=[UIColor colorWithWhite:0 alpha:0.5];
//    _coverwindow.windowLevel=UIWindowLevelNormal;
//    _coverwindow.hidden=YES;
//    [[UIApplication sharedApplication].keyWindow addSubview:_coverwindow];
    //[[UIApplication sharedApplication].keyWindow addSubview:_leftViewController.view];
    //_leftViewController.view.hidden=YES;
}
-(void)showLeft{
    //_sidemenu.tabBarController.tabBar.hidden=YES;
    //UIWindow *window = [UIApplication sharedApplication].keyWindow;
    //window.rootViewController=_sidemenu;
    //_coverwindow.hidden=NO;
    //_leftViewController.view.hidden=NO;
    [_sidemenu showLeftViewAnimated];
}
-(void)dismissLeft{
    //_sidemenu.tabBarController.tabBar.hidden=NO;
    //UIWindow *window = [UIApplication sharedApplication].keyWindow;
    //window.rootViewController=_sidemenu.parentViewController;
    //_leftViewController.view.hidden=YES;
    [_sidemenu hideLeftViewAnimated];
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
}
-(void)viewWillDisappear:(BOOL)animated{
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
