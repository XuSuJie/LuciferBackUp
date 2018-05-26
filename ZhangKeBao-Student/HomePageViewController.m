//
//  HomePageViewController.h
//  test
//
//  Created by 徐溯杰 on 2018/4/24.
//  Copyright © 2018年 fjnu. All rights reserved.
//
#import "HomePageViewController.h"
#import <Charts/Charts-Swift.h>
@implementation HomePageViewController
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
    collectionView.backgroundColor =[UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    //[self.view addSubview:collectionView];
    // 注册cell
    [collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:ID];
    //菜单按钮
    UIBarButtonItem* leftbtn=[[UIBarButtonItem alloc]initWithTitle:@"菜单" style:UIBarButtonItemStylePlain target:self action:@selector(showLeft)];
    self.navigationItem.leftBarButtonItem=leftbtn;
    //签到按钮
    UIBarButtonItem* rightbtn=[[UIBarButtonItem alloc]initWithTitle:@"签到" style:UIBarButtonItemStylePlain target:self action:@selector(SignIn)];
    self.navigationItem.rightBarButtonItem=rightbtn;
    //配置手势
    UISwipeGestureRecognizer* swipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(showLeft)];
    swipe.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
}
-(void)showLeft{
        LeftViewDemo* leftvc=[LeftViewDemo sharedInstance];
        if (!_coverView) {
            _coverView = [[CoverView alloc] init];
        }
        [UIView animateWithDuration:0.2 animations:^{
            self->_coverView.alpha = 0.8;
            self.tabBarController.view.frame = CGRectMake(SCREEN_SIZE.width*3/4, 0, SCREEN_SIZE.width, SCREEN_SIZE.height);
            leftvc.view.frame = CGRectMake(0, 0, SCREEN_SIZE.width*3/4, SCREEN_SIZE.height);
        }];
}
-(void)SignIn{
//    UIViewController* vc=[[UIViewController alloc]init];
//    vc.view.backgroundColor=[UIColor colorWithWhite:0 alpha:0.5];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"今日签到" message:@"总之岁月漫长，然而值得等待" preferredStyle:UIAlertControllerStyleAlert];//今日签到还要显示当天日期
    [alert addAction:[UIAlertAction actionWithTitle:@"签到" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        dispatch_queue_t queue =dispatch_queue_create("SignIn", DISPATCH_QUEUE_SERIAL);
        NetWorkManager* manager=[NetWorkManager sharedManager];
        [manager.requestSerializer setValue:[LoginedUser sharedInstance].token forHTTPHeaderField:@"token"];
        NSString *url=@"https://test.extlife.xyz:8443/user/signnow";
        dispatch_async(queue, ^{
            [manager  POST:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                 NSLog(@"%@",responseObject[@"data"]);
                 if([responseObject[@"status"] isEqualToString:@"Success"]){
                    [self showMessage:@"签到成功"];
                     //签到积分增加，签到日历上多一天
                 }
                 if([responseObject[@"status"] isEqualToString:@"Fail"]){
                     if([responseObject[@"errormsg"] isEqualToString:@"TodayHasSign"])
                         [self showMessage:@"今日已签到"];
                 }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self showMessage:@"网络错误,签到失败"];
            }];
        });
    }]];
    [self presentViewController:alert animated:true completion:nil];
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
- (void)showMessage:(NSString *)Msg {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:Msg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:true completion:nil];
}
@end
