//
//  LoginViewController.m
//  CocoaPodsTest
//
//  Created by 徐溯杰 on 2018/4/17.
//  Copyright © 2018年 fjnu. All rights reserved.
//
#import "ApplicaionAppend.h"
#import "LoginViewController.h"
#import "ImputMessage.h"
@implementation LoginViewController
- (void)viewDidLoad {
    [super viewDidLoad];
//  NSString *path = [[NSBundle mainBundle] pathForResource:@"123" ofType:@"jpg"];
//  UIImage *myImage = [UIImage imageWithContentsOfFile:path];
//  self.view.layer.contents = (id)myImage.CGImage;
    self.title=@"";
    //输入框
    [self.view setBackgroundColor:[UIColor whiteColor]];
    phoneText=[[Textfield alloc]initWithFrame:CGRectMake(20, 150, SCREEN_SIZE.width-40, 30) Width:SCREEN_SIZE.width-40];
    [phoneText setPlaceholder:@"手机/邮箱/用户"];
    [self.view addSubview:phoneText];
    
    passwdText=[[Textfield alloc]initWithFrame:CGRectMake(20, 210, SCREEN_SIZE.width-40, 30) Width:SCREEN_SIZE.width-40];
    [passwdText setPlaceholder:@"密码"];
    [passwdText setSecureTextEntry:YES];
    [self.view addSubview:passwdText];
    
    //登录
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    loginBtn.frame = CGRectMake(SCREEN_SIZE.width/2 - 125, 325, 250, 40);
    loginBtn.titleLabel.font=[UIFont systemFontOfSize:25.0];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.layer.masksToBounds = YES;
    loginBtn.layer.cornerRadius = 10;
    loginBtn.backgroundColor = [UIColor cyanColor];
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    //找回密码
    UIButton *passwdBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    passwdBtn.frame = CGRectMake(SCREEN_SIZE.width/4 - 50, 265, 100, 30);
    [passwdBtn setTitle:@"找回密码" forState:UIControlStateNormal];
    passwdBtn.layer.masksToBounds = YES;
    passwdBtn.layer.cornerRadius = 10;
    //passwdBtn.backgroundColor = [UIColor cyanColor];
    [passwdBtn addTarget:self action:@selector(getPassword) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:passwdBtn];
    //注册按钮
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    registerBtn.frame = CGRectMake(SCREEN_SIZE.width/4*3 - 50, 265, 100, 30);
    [registerBtn setTitle:@"立即注册" forState:UIControlStateNormal];
    registerBtn.layer.masksToBounds = YES;
    registerBtn.layer.cornerRadius = 10;
    //registerBtn.backgroundColor = [UIColor cyanColor];
    [registerBtn addTarget:self action:@selector(pushRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    //标签
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width/2-75, 400, 150, 30)];
    //label.backgroundColor=[UIColor whiteColor];
    label.text=@"第三方登录";
    label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label];
    //qq按钮
    UIButton *qqbutton = [UIButton buttonWithType:UIButtonTypeSystem];
    qqbutton.frame = CGRectMake(SCREEN_SIZE.width/4 - 50, 455, 100, 30);
    [qqbutton setTitle:@"QQ" forState:UIControlStateNormal];
    [qqbutton setImage:[UIImage imageNamed:@"left_selcet_img.png"] forState:UIControlStateNormal];
    [qqbutton addTarget:self action:@selector(qqLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:qqbutton];
}
//找回密码(未编写)
- (void)getPassword{
    UIViewController *password = [[UIViewController alloc]init];
    password.view.backgroundColor=[UIColor whiteColor];
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:password animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}
//注册界面
-(void)pushRegister{
    RegisterViewController *registe = [[RegisterViewController alloc]init];
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:registe animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}
//QQ注册和登录
-(void)qqLogin{
    _tencentOAuth =[[TencentOAuth alloc]initWithAppId:@"1106862042" andDelegate:self];
    _permissions =  [NSArray arrayWithObjects:@"get_user_info",@"get_simple_userinfo",@"add_t",nil];
    //登录操作
    [_tencentOAuth authorize:_permissions];
    //保存授权信息
    //[_tencentOAuth accessToken] ;授权信息参数1
    //[_tencentOAuth openId] ;参数2
    //[_tencentOAuth expirationDate];参数3
    //[_tencentOAuth getCachedOpenID];
    //[_tencentOAuth getCachedToken];
    //获取用户信息，头像，昵称[_tencentOAuth getUserInfo];

//    UIViewController *qqView = [[UIViewController alloc]init];
//    [qqView.view setBackgroundColor:[UIColor whiteColor]];
//    qqView.title=@"QQ登录";
//    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width/2-100, 200, 200, 30)];
//    [label setText:@"掌课宝"];
//    UIButton* button=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width/2 - 125, 345, 250, 40)];
//    [button setTitle:@"登录" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [button setBackgroundColor:[UIColor blueColor]];
//    [qqView.view addSubview:button];
//    [qqView.view addSubview:label];
//    self.hidesBottomBarWhenPushed=YES;
//    [self.navigationController pushViewController:qqView animated:YES];
//    self.hidesBottomBarWhenPushed=NO;
}
//登录功能
-(void)login{
    if(phoneText.text.length==0 || passwdText.text.length==0){
        [self showMessage:@"账户或密码不能为空"];
        return;
    }
    LoadingView* loading=[[LoadingView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:loading];
    [loading show];
    NSString *url=@"https://test.extlife.xyz:8443/user/login";
    NSDictionary *parameters=@{@"auth":@1,@"phone":phoneText.text,@"password":passwdText.text};
    [[NetWorkManager sharedManager] GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            dispatch_sync(dispatch_get_main_queue(), ^{
                [loading disappear];
                [NSThread sleepForTimeInterval:2.0];
            });
            dispatch_sync(dispatch_get_main_queue(), ^{
                NSLog(@"responseObject-->%@",responseObject);
                if([responseObject[@"status"] isEqualToString:@"Fail"]){
                    if ([responseObject[@"errormsg"] isEqualToString:@"PasswordIncorrect"])
                        [self showMessage:@"密码错误"];
                    if ([responseObject[@"errormsg"] isEqualToString:@"NoUser"])
                        [self showMessage:@"账户不存在"];
                    //if ([responseObject[@"errormsg"] isEqualToString:@"CaptchaRequire"]) 需要验证码
                }
                else{
                    NSLog(@"%@",responseObject[@"token"]);
                    ApplicaionAppend* app=[[ApplicaionAppend alloc]init];
                    UIWindow *window = [UIApplication sharedApplication].keyWindow;
                    window.rootViewController=app;
                }
            });
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            dispatch_sync(dispatch_get_main_queue(), ^{
                [loading disappear];
            });
            dispatch_sync(dispatch_get_main_queue(), ^{
                [self showMessage:@"网络无连接"];
            });
        });
    }];
}
- (void)showMessage:(NSString *)Msg {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:Msg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:true completion:nil];
}
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    return [TencentOAuth HandleOpenURL:url];
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [TencentOAuth HandleOpenURL:url];
}
- (void)tencentDidLogin {
    [self showMessage:@"QQ登录成功"];
    if (_tencentOAuth.accessToken && 0 != [_tencentOAuth.accessToken length]){
        //  记录登录用户的OpenID、Token以及过期时间
        NSLog(@"%@",_tencentOAuth.accessToken) ;
    }
    else{
        NSLog(@"登录失败 没有获取accesstoken");
    }
}
- (void)tencentDidNotLogin:(BOOL)cancelled {
    if (cancelled) {
        NSLog(@"用户注销");
    } else {
        [self showMessage:@"QQ登录失败"];
    }
}
- (void)tencentDidNotNetWork {
    [self showMessage:@"网络无连接"];
}
- (void)getUserInfoResponse:(APIResponse *)response {
    if (response && response.retCode == URLREQUEST_SUCCEED) {
        NSDictionary *userInfo = [response jsonResponse];
        NSString *nickName = userInfo[@"nickname"];
        NSLog(@"NickName is %@",nickName);
    } else {
        NSLog(@"QQ auth fail ,getUserInfoResponse:%d", response.detailRetCode);
    }
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
