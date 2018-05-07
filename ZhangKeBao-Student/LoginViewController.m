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
    //[self.view setBackgroundColor:[UIColor whiteColor]];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *resourcePath = [bundle resourcePath];
    //背景图片
    NSString *filePath = [resourcePath stringByAppendingPathComponent:@"底图"];
    MyImage* bgi=[[MyImage alloc]init];
    //图片宽度设定为屏幕宽度
    UIImage* bgImage=[bgi imageCompressForWidthScale:[UIImage imageWithContentsOfFile:filePath] targetWidth:SCREEN_SIZE.width];
    UIImageView* background=[[UIImageView alloc]initWithImage:bgImage];
    background.contentMode=UIViewContentModeScaleAspectFill;
    [self.view addSubview:background];
    //logo
    NSString* Path = [resourcePath stringByAppendingPathComponent:@"logo"];
    UIImageView* logoView=[[UIImageView alloc]initWithFrame:CGRectMake(SIZE_SHIFT*70, SIZE_SHIFT*178, SIZE_SHIFT*250, SIZE_SHIFT*86)];
    logoView.contentMode=UIViewContentModeScaleAspectFill;
    logoView.image=[UIImage imageWithContentsOfFile:Path];
    [self.view addSubview:logoView];
    self.title=@"";
    //输入框
    phoneText=[[UITextField alloc]initWithFrame:CGRectMake(SIZE_SHIFT*70, SIZE_SHIFT*326, SIZE_SHIFT*610, SIZE_SHIFT*106)];
    [phoneText setPlaceholder:@"手机号/邮箱"];
    //[phoneText setBorderStyle:UITextBorderStyleBezel];
    [self.view addSubview:phoneText];
    
    passwdText=[[UITextField alloc]initWithFrame:CGRectMake(SIZE_SHIFT*70, SIZE_SHIFT*432, SIZE_SHIFT*610, SIZE_SHIFT*106)];
    [passwdText setPlaceholder:@"密码"];
    [passwdText setSecureTextEntry:YES];
    //[passwdText setBorderStyle:UITextBorderStyleRoundedRect];
    [self.view addSubview:passwdText];
    //登录
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    loginBtn.frame = CGRectMake(SIZE_SHIFT*70, SIZE_SHIFT*584, SIZE_SHIFT*610, SIZE_SHIFT*94);
    loginBtn.titleLabel.font=[UIFont systemFontOfSize:22.0];
    [loginBtn setTitle:@"登    录" forState:UIControlStateNormal];
    loginBtn.layer.masksToBounds = YES;
    loginBtn.layer.cornerRadius = 23;
    loginBtn.backgroundColor = [UIColor colorWithRed:0 green:(CGFloat)150/255 blue:1 alpha:0.7];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    //找回密码
    UIButton *passwdBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    passwdBtn.frame = CGRectMake(SIZE_SHIFT*76, SIZE_SHIFT*712, 61.5, 30);
    [passwdBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    passwdBtn.layer.masksToBounds = YES;
    passwdBtn.layer.cornerRadius = 10;
    //passwdBtn.titleLabel.textColor = [UIColor colorWithRed:0 green:(CGFloat)151/255 blue:1 alpha:0.7];
    [passwdBtn addTarget:self action:@selector(getPassword) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:passwdBtn];
    //注册按钮
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    registerBtn.frame = CGRectMake(SCREEN_SIZE.width/2+SIZE_SHIFT*149, SIZE_SHIFT*712, 76.5, 30);
    [registerBtn setTitle:@"新用户注册" forState:UIControlStateNormal];
    registerBtn.layer.masksToBounds = YES;
    registerBtn.layer.cornerRadius = 10;
    //registerBtn.backgroundColor = [UIColor cyanColor];
    [registerBtn addTarget:self action:@selector(pushRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    //标签
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width/2-75, SIZE_SHIFT*1092, 150, SIZE_SHIFT*28)];
    //label.backgroundColor=[UIColor whiteColor];
    label.text=@"第三方登录";
    label.font=[UIFont systemFontOfSize:14];
    label.textColor=[UIColor whiteColor];
    label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label];
    //qq按钮
    UIButton *qqbutton = [UIButton buttonWithType:UIButtonTypeSystem];
    qqbutton.frame = CGRectMake(SCREEN_SIZE.width/2-SIZE_SHIFT*153,SIZE_SHIFT*1137, 44, 44);
    NSLog(@"%f",SCREEN_SIZE.height);
    qqbutton.imageView.alpha=0.9;
    NSString* qqfilePath = [resourcePath stringByAppendingPathComponent:@"QQ"];
    [qqbutton setBackgroundImage:[UIImage imageWithContentsOfFile:qqfilePath] forState:UIControlStateNormal];
    [qqbutton addTarget:self action:@selector(qqLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:qqbutton];
    //微信按钮
    UIButton *wxbutton = [UIButton buttonWithType:UIButtonTypeSystem];
    wxbutton.frame = CGRectMake(SCREEN_SIZE.width/2+SIZE_SHIFT*65,SCREEN_SIZE.height- SIZE_SHIFT*198, SIZE_SHIFT*88, SIZE_SHIFT*88);
    wxbutton.imageView.alpha=0.9;
    NSString* wxfilePath = [resourcePath stringByAppendingPathComponent:@"微信"];
    [wxbutton setBackgroundImage:[UIImage imageWithContentsOfFile:wxfilePath] forState:UIControlStateNormal];
    [wxbutton addTarget:self action:@selector(qqLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:wxbutton];
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
                    [LoginedUser sharedInstance].token=responseObject[@"token"];
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
//弹窗
- (void)showMessage:(NSString *)Msg {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:Msg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:true completion:nil];
}
- (void)drawRect:(CGRect)rect {
    UIColor *color = [UIColor whiteColor];
    [color set]; //设置线条颜色
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(SCREEN_SIZE.width/2-50, SIZE_SHIFT*1110)];//起点
    [path addLineToPoint:CGPointMake(SIZE_SHIFT*40, SIZE_SHIFT*1110)];
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound; //线条拐角
    path.lineJoinStyle = kCGLineJoinRound; //终点处理
    
    [path stroke];
    [path moveToPoint:CGPointMake(SIZE_SHIFT*70, SIZE_SHIFT*326)];//起点
    [path addLineToPoint:CGPointMake(SIZE_SHIFT*680, SIZE_SHIFT*326)];
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound; //线条拐角
    path.lineJoinStyle = kCGLineJoinRound; //终点处理
    
    [path stroke];
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
