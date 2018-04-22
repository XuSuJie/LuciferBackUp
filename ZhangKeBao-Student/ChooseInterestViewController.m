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
    DBSphereView* cloud=[[DBSphereView alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width/2-160, 100, 320, 320)];
//    for (NSInteger i = 0; i < 50; i ++) {
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
//        [btn setTitle:[NSString stringWithFormat:@"标签%ld", i] forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
//        btn.titleLabel.font = [UIFont systemFontOfSize:25.];
//        btn.frame = CGRectMake(0, 0, 90, 20);
//       [btn addTarget:self action:@selector(choose:) forControlEvents:UIControlEventTouchUpInside];
//        [_tags addObject:btn];
//        [cloud addSubview:btn];
//    }
    [self  reloadTags:cloud];
    _nextbtn=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width-60, 10, 50, 50)];
    [_nextbtn setImage:[UIImage imageNamed:@"Next_22px.png"] forState:UIControlStateNormal];
    [_nextbtn addTarget:self action:@selector(nextpage) forControlEvents:UIControlEventTouchUpInside];
    [_nextbtn setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:_nextbtn];
}
-(void)nextpage{
    [self.view removeFromSuperview];
    [self.parentViewController.view addSubview:self.parentViewController.childViewControllers[1].view];
}
-(void)reloadTags:(DBSphereView*)cloud{
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    dispatch_queue_t queue =dispatch_queue_create("getTags", DISPATCH_QUEUE_SERIAL);
    NetWorkManager* manager=[NetWorkManager sharedManager];
    _token=@"9b206ae469ee4d08b8a7464839f6df63";
    [manager.requestSerializer setValue:_token forHTTPHeaderField:@"token"];
    NSString *url=@"https://test.extlife.xyz:8443/userinfo/getusertags";
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
}
//控制器消失
- (void)viewDidDisappear:(BOOL)animated{
    [_button setBackgroundColor:[UIColor grayColor]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
