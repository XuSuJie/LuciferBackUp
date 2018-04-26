//
//  RegisterViewController.m
//  CocoaPodsTest
//
//  Created by 徐溯杰 on 2018/3/31.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "RegisterViewController.h"
#import "NetWorkManager.h"
#define Height 120
#define TIMECOUNT 20
@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"立即注册";
    [self.navigationController setNavigationBarHidden:NO];
    self.count=TIMECOUNT;
    self.view.backgroundColor = [UIColor whiteColor];
    phoneText=[[Textfield alloc]initWithFrame:CGRectMake(20, Height, SCREEN_SIZE.width, 35)Width:SCREEN_SIZE.width-40];
    [phoneText setPlaceholder:@"输入手机号"];
    [self.view addSubview:phoneText];
    captchaText=[[Textfield alloc]initWithFrame:CGRectMake(20, Height+50, SCREEN_SIZE.width, 35) Width:SCREEN_SIZE.width/2];
    [captchaText setPlaceholder:@"输入验证码"];
    [self.view addSubview:captchaText];
    //发送验证码
    self.captBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.captBtn.frame = CGRectMake(SCREEN_SIZE.width/2+25, Height+50, SCREEN_SIZE.width/2-45, 35);
    [self.captBtn setTitle:@"点击获取验证码" forState:UIControlStateNormal];
    [self.captBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [self.captBtn setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    [self.captBtn setBackgroundColor:[UIColor clearColor]];
    [self.captBtn.layer setBorderColor:[UIColor cyanColor].CGColor];
    self.captBtn.layer.masksToBounds = YES;
    self.captBtn.layer.cornerRadius = 10;//圆角半径
    [self.captBtn addTarget:self action:@selector(getCode) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.captBtn];
    passwdText=[[Textfield alloc]initWithFrame:CGRectMake(20, Height+100, SCREEN_SIZE.width, 35)Width:SCREEN_SIZE.width-40];
    [passwdText setPlaceholder:@"创建登录密码"];
    [passwdText setSecureTextEntry:YES];
    [self.view addSubview:passwdText];
    
    //注册
    UIButton *regiBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    regiBtn.frame = CGRectMake(10, 330, SCREEN_SIZE.width-20, 40);
    regiBtn.layer.masksToBounds = YES;
    regiBtn.layer.cornerRadius = 10;
    regiBtn.backgroundColor = [UIColor greenColor];
    [regiBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [regiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    regiBtn.titleLabel.font= [UIFont systemFontOfSize:25.0];
    [regiBtn addTarget:self action:@selector(registerAFN) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:regiBtn];
//    返回按钮
//    UIButton *retuBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//    retuBtn.frame = CGRectMake(SCREEN_SIZE.width/2 - 50, 390, 100, 30);
//    [retuBtn setTitle:@"返回" forState:UIControlStateNormal];
//    [retuBtn addTarget:self action:@selector(backPress) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:retuBtn];
    
}
-(void)registerAFN{
    if (phoneText.hasText && passwdText.hasText && captchaText.hasText) {
        //dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        if(randchar==nil){
            [self showMessage:@"无效验证码,请重试"];
            return;
        }
        NSString *url=@"https://test.extlife.xyz:8443/user/register";
        NSDictionary *parameters=@{@"phone":self->phoneText.text,@"password":self->passwdText.text,@"type":@1,
                                   @"randchar":self->randchar,@"captcha":self->captchaText.text};
        [[NetWorkManager sharedManager]  GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"responseObject-->%@",responseObject);
            if([responseObject[@"status"] isEqualToString:@"Success"]){
                [self showMessage:@"注册成功"];
                ImputMessage* view=[[ImputMessage alloc]init];
                view.token=responseObject[@"token"];//填写信息界面接收token
                [self presentViewController:view animated:YES completion:nil];
            }
            if ([responseObject[@"status"] isEqualToString:@"Fail"]) {
                if([responseObject[@"errormsg"] isEqualToString:@"CaptchaWrong"])
                    [self showMessage:@"验证码错误"];
                if([responseObject[@"errormsg"] isEqualToString:@"UserAlready"])
                    [self showMessage:@"用户已存在"];
                if([responseObject[@"errormsg"] isEqualToString:@"NoRandChar"])
                    [self showMessage:@"验证码过期"];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //dispatch_semaphore_signal(sema);
            NSHTTPURLResponse* urlResponse=(NSHTTPURLResponse*)task.response;
            [self showMessage:[NSString stringWithFormat:@"注册失败,错误%ld",urlResponse.statusCode ]];
        }];
    }
    else
        [self showMessage:@"请补全信息"];
}
-(void)getCode{
    //异步任务+信号量
    if(self->phoneText.hasText==NO){
        [self showMessage:@"请填写手机号"];
        return;
    }
    __block LoadingView* loading=[[LoadingView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    __block UILabel* label;
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    dispatch_queue_t queue =dispatch_queue_create("getCode", DISPATCH_QUEUE_SERIAL);
    NSString *url=@"https://test.extlife.xyz:8443/user/getcode";
    NSDictionary *parameters=@{@"auth":@1,@"phone":[self->phoneText text]};
    dispatch_async(queue, ^{
        [[NetWorkManager sharedManager]  GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"get");
            NSLog(@"%@",responseObject[@"data"]);
            self->randchar=responseObject[@"data"];
            dispatch_semaphore_signal(sema);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"get null");
            dispatch_semaphore_signal(sema);
        }];
    //出现弹窗
    dispatch_async(dispatch_get_main_queue(), ^{
        [loading show];
        label=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width/2-100, (SCREEN_SIZE.height-49)/2+100, 200, 30)];
        [label setText:@"正在获取验证码"];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setFont:[UIFont systemFontOfSize:20.0]];
        [self.view addSubview:label];
        [self.view addSubview:loading];
    });
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    //弹窗消失
    dispatch_async(dispatch_get_main_queue(), ^{
        [label removeFromSuperview];
        [loading disappear];
    });
        //[alertView dismissAnimated:YES completionHandler:nil];
        //alertView=nil;
        //[alert dismissViewControllerAnimated:YES completion:nil];
        [self performSelectorInBackground:@selector(timeThread) withObject:nil];
    });
}
-(void)backgroundToDark:(AddSpaceView*)addSpaceView{
    self.inputView.layer.cornerRadius = 12;
    self.inputView.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    self.inputView.center = addSpaceView.center;
    [addSpaceView setDelegate:self];
    [addSpaceView addSubview:self.inputView];
    [addSpaceView show];
}
-(void)timeThread{
    for (int i =TIMECOUNT; i>0; i--) {
        self.count--;
        [self performSelectorOnMainThread:@selector(timeUpdate) withObject:nil waitUntilDone:YES];
        sleep(1);
    }
}
-(void)timeUpdate{
    NSString* str=nil;
    if (self.count==0) {
        str=[NSString stringWithFormat:@"点击获取验证码"];
        [self.captBtn setUserInteractionEnabled:YES];
        [self.captBtn setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
        [self.captBtn setBackgroundColor:[UIColor clearColor]];
        [self.captBtn.layer setBorderColor:[UIColor cyanColor].CGColor];
        self.count=TIMECOUNT;
    } else {
        str=[NSString stringWithFormat:@"%d秒后可再获取",self.count];
        [self.captBtn setUserInteractionEnabled:NO];
        [self.captBtn setBackgroundColor:[UIColor lightGrayColor]];
        [self.captBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    [self.captBtn setTitle:str forState:UIControlStateNormal];
}
-(void)register2{
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(registerAFN) object:nil];
    [operation start];
}
- (void)showMessage:(NSString *)Msg {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:Msg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:true completion:nil];
}
- (void)inputCaptcha/*:(id)sender*/ {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"短信验证" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    //增加确定按钮；
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //获取第1个输入框；
        //self->captchaText = alertController.textFields.firstObject;
        //NSLog(@"%@",self->captchaText.text);
    }]];
    //增加取消按钮；
    //[alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    //定义第一个输入框；
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入验证码";
    }];
    [self presentViewController:alertController animated:true completion:nil];
}
//控制器消失
- (void)viewDidDisappear:(BOOL)animated{
    [self.timer invalidate];
    NSLog(@"disappear");
     [self.navigationController setNavigationBarHidden:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
