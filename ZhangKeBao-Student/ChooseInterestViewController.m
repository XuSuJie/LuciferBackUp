//
//  ChooseInterestViewController.m
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/4/21.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "ChooseInterestViewController.h"
@interface ChooseInterestViewController ()

@end

@implementation ChooseInterestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    _tags=[[NSMutableArray alloc]initWithCapacity:0];
    _interest=[[NSMutableArray alloc]initWithCapacity:0];
    //标题
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width/2-105, 25, 210, 24)];
    [label setFont:[UIFont systemFontOfSize:20.0]];
    [label setText:@"挑选出你感兴趣的标签"];
    [label setTextColor:[UIColor blackColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:label];
    //标签云
    DBSphereView* cloud=[[DBSphereView alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width/2-160, 100, 320, 320)];
    [self  reloadTags:cloud];
    //下一页按钮
    _nextbtn=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width-60, 10, 50, 50)];
    [_nextbtn setTitle:@">" forState:UIControlStateNormal];
    [_nextbtn setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    _nextbtn.titleLabel.font=[UIFont systemFontOfSize:45.0];
    _nextbtn.backgroundColor=[UIColor whiteColor];
    [_nextbtn addTarget:self action:@selector(nextpage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_nextbtn];
}
-(void)nextpage{
    [self.view removeFromSuperview];
    [self.parentViewController.view addSubview:self.parentViewController.childViewControllers[1].view];
}
//加载服务器的标签
-(void)reloadTags:(DBSphereView*)cloud{
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    dispatch_queue_t queue =dispatch_queue_create("getTags", DISPATCH_QUEUE_SERIAL);
    NetWorkManager* manager=[NetWorkManager sharedManager];
    [manager.requestSerializer setValue:[LoginedUser sharedInstance].token forHTTPHeaderField:@"token"];
    NSString *url=@"https://test.extlife.xyz:8443/userinfo/getglobaltags";
    dispatch_async(queue, ^{
        [manager  POST:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@",responseObject[@"data"]);
            self->_dictionary=responseObject[@"data"];
            dispatch_semaphore_signal(sema);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            dispatch_semaphore_signal(sema);
            NSLog(@"get null");
        }];
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        //获取全部标签后加载
        for (NSInteger i = 0; i < self->_dictionary.count; i ++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
            NSString* key=[NSString stringWithFormat:@"%ld",i];
            [btn setTitle:[NSString stringWithFormat:@"%@",[self->_dictionary valueForKey:key]] forState:UIControlStateNormal];
            NSLog(@"%@",[self->_dictionary valueForKey:key]);
            [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:25.];
            btn.frame = CGRectMake(0, 0, 90, 20);
            [btn addTarget:self action:@selector(choose:) forControlEvents:UIControlEventTouchUpInside];
            [self->_tags addObject:btn];
            [cloud addSubview:btn];
        }
        });
        dispatch_async(dispatch_get_main_queue(), ^{
            [cloud setCloudTags: self->_tags];
            [self.view addSubview:cloud];
            [cloud timerStart];
        });
}
//选择标签
-(void)choose:(UIButton*)button{
    if (![_interest containsObject:button.currentTitle]) {
        [_interest addObject:button.currentTitle];
    }
    else
        [_interest removeObject:button.currentTitle];
    if (button.currentTitleColor ==[UIColor darkGrayColor]) {
         [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    else
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
}
//控制器即将显示时
- (void)viewWillAppear:(BOOL)animated{
    [_button setBackgroundColor:[UIColor blueColor]];
    //发送通知
    NSDictionary *dict = @{@"view":self};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeView" object:nil userInfo:dict];
    NSLog(@"1显示");
}
//控制器消失
- (void)viewWillDisappear:(BOOL)animated{
    [_button setBackgroundColor:[UIColor grayColor]];
    NSLog(@"1消失");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
