//
//  PersonalMessage.m
//  ZhangKeBao-Student
//
//  Created by 徐溯杰 on 2018/4/21.
//  Copyright © 2018年 fjnu. All rights reserved.
//

#import "PersonalMessage.h"

@interface PersonalMessage ()

@end

@implementation PersonalMessage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
//    for(NSInteger i=10;i<10+35*5;i+=35){
//        UITextField* field=[[UITextField alloc]initWithFrame:CGRectMake(40, i,SCREEN_SIZE.width-150, 35)];
//        field.borderStyle=UITextBorderStyleLine;
//        [field setTextAlignment:NSTextAlignmentRight];
//        [self.view addSubview:field];
//    }
    _Name=@"小明";
    _Class=@"三班";
    _Grade=@"高二";
    _School=@"福州三中";
    _Sex=@"男";
    //选择省市
    UIButton* button1=[[UIButton alloc]initWithFrame:CGRectMake(50,200, SCREEN_SIZE.width/2-100, 35)];
    [button1 setTitle:@"选择省市" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor blueColor]];
    [button1 addTarget:self action:@selector(chooseExamPosition) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    //确认注册
    UIButton* button=[[UIButton alloc]initWithFrame:CGRectMake(10, 380, SCREEN_SIZE.width-20, 40)];
    [button setTitle:@"注册" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor greenColor]];
    [button setTintColor:[UIColor blackColor]];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(upload) forControlEvents:UIControlEventTouchUpInside];
    //上一页
    _prebtn=[[UIButton alloc]initWithFrame:CGRectMake( 10, 10, 50, 50)];
    [_prebtn setImage:[UIImage imageNamed:@"Next_22px.png"] forState:UIControlStateNormal];
    [_prebtn setBackgroundColor:[UIColor blueColor]];
    [_prebtn addTarget:self action:@selector(prepage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_prebtn];
    //下一页
    _nextbtn=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width-60, 10, 50, 50)];
    [_nextbtn setImage:[UIImage imageNamed:@"Next_22px.png"] forState:UIControlStateNormal];
    [_nextbtn setBackgroundColor:[UIColor blueColor]];
    [_nextbtn addTarget:self action:@selector(nextpage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_nextbtn];
}
-(void)upload{
    if(_Interest.count==0){
        [self showMessage:@"未选择标签!"];
        return;
    }
    if (_Array2==nil || _Array1==nil ||_Sex==nil || _Name==nil || _Class==nil || _Grade==nil) {
        [self showMessage:@"信息不完整!"];
        return;
    }
    NetWorkManager* manager=[NetWorkManager sharedManager];
    _token=@"171a4cb7fc874bd5aea472b4b161a147";
    [manager.requestSerializer setValue:_token forHTTPHeaderField:@"token"];
    NSString *url=@"https://test.extlife.xyz:8443/userinfo/setusertags";
    _dictionary=[[NSMutableDictionary alloc]initWithCapacity:0];
    for (NSInteger i=0;i<_Interest.count; i++) {
        NSString* key=[NSString stringWithFormat:@"%ld",i];
        [_dictionary setObject:[_Interest objectAtIndex:i] forKey:key];
    }
    _dictionary1=@{
                  @"Name" : _Name,
                  @"Sex" : _Sex,
                  @"province1" : _Array1[0],
                  @"city1" : _Array1[1],
                  @"area1" : _Array1[2],
                  @"province2" : _Array2[0],
                  @"city2" : _Array2[1],
                  @"area2" : _Array2[2],
                  @"School" : _School,
                  @"Grade" : _Grade,
                  @"Class" : _Class
                  };
    NSLog(@"%@",_dictionary1);
    [manager POST:url parameters:_dictionary progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject){
        NSLog(@"success");
        NSLog(@"%@",responseObject);
        if ([responseObject[@"errormsg"] isEqualToString:@"None"]) {
            //跳转到第三页
            [self.view removeFromSuperview];
            [self.parentViewController.view addSubview:self.parentViewController.childViewControllers[2].view];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failure");
        //NSLog(@"%@",error);
    }];
}
-(void)prepage{
    [self.view removeFromSuperview];
    [self.parentViewController.view addSubview:self.parentViewController.childViewControllers[0].view];
}
-(void)nextpage{
    [self.view removeFromSuperview];
    [self.parentViewController.view addSubview:self.parentViewController.childViewControllers[2].view];
}
-(void)chooseExamPosition{
    [[MOFSPickerManager shareManger] showMOFSAddressPickerWithTitle:nil cancelTitle:@"取消" commitTitle:@"完成" commitBlock:^(NSString *address, NSString *zipcode) {
        NSLog(@"%@",address);
        self->_Array1 =[address componentsSeparatedByString:@"-"];
        self->_Array2=[address componentsSeparatedByString:@"-"];
        NSLog(@"%@",self->_Array1);
    } cancelBlock:^{
    }];
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
//提示信息
- (void)showMessage:(NSString *)Msg {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:Msg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:true completion:nil];
}
//返回有几列
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}
//返回指定列的行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component

{
    if (component==0) {
        return  5;
    } else if(component==1){
        return  [_Array1 count];
    }
    return [_Array1 count];
}
//返回指定列，行的高度，就是自定义行的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 20.0f;
}
//返回指定列的宽度
- (CGFloat) pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
//    if (component==0) {//iOS6边框占10+10
//        return  self.view.frame.size.width/3;
//    } else if(component==1){
//        return  self.view.frame.size.width/3;
//    }
//    return  self.view.frame.size.width/3;
    return SCREEN_SIZE.width/3;
}
// 自定义指定列的每行的视图，即指定列的每行的视图行为一致
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    if (!view){
        view = [[UIView alloc]init];
    }
    UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width/3, 20)];
    text.textAlignment = NSTextAlignmentCenter;
    text.text = [_Array1 objectAtIndex:row];
    [view addSubview:text];
    //隐藏上下直线
    [_picker.subviews objectAtIndex:1].backgroundColor = [UIColor clearColor];
    [_picker.subviews objectAtIndex:2].backgroundColor = [UIColor clearColor];
    return view;
}
//显示的标题
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *str = [_Array1 objectAtIndex:row];
    return str;
}
//显示的标题字体、颜色等属性
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *str = [_Array1 objectAtIndex:row];
    NSMutableAttributedString *AttributedString = [[NSMutableAttributedString alloc]initWithString:str];
    [AttributedString addAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18], NSForegroundColorAttributeName:[UIColor whiteColor]} range:NSMakeRange(0, [AttributedString  length])];
    return AttributedString;
}//NS_AVAILABLE_IOS(6_0);
//被选择的行
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"HANG%@",[_Array1 objectAtIndex:row]);
}



@end
