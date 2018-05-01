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
    _imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    _imageView.image = [UIImage imageNamed:@"bg_icon_intro"];
    //标题
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width/2-105, 25, 210, 24)];
    [label setFont:[UIFont systemFontOfSize:20.0]];
    [label setText:@"完善信息"];
    [label setTextColor:[UIColor blackColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:label];
    //确认注册
    UIButton* button=[[UIButton alloc]initWithFrame:CGRectMake(10, SCREEN_SIZE.height/2+70, SCREEN_SIZE.width-20, 40)];
    [button setTitle:@"注册" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor greenColor]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(upload) forControlEvents:UIControlEventTouchUpInside];
    //上一页
    _prebtn=[[UIButton alloc]initWithFrame:CGRectMake( 10, 10, 50, 50)];
    [_prebtn setTitle:@"<" forState:UIControlStateNormal];
    [_prebtn setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    _prebtn.titleLabel.font=[UIFont systemFontOfSize:45.0];
    _prebtn.backgroundColor=[UIColor whiteColor];
    [_prebtn addTarget:self action:@selector(prepage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_prebtn];
    //下一页
    _nextbtn=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width-60, 10, 50, 50)];
    [_nextbtn setTitle:@">" forState:UIControlStateNormal];
    [_nextbtn setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    _nextbtn.titleLabel.font=[UIFont systemFontOfSize:45.0];
    _nextbtn.backgroundColor=[UIColor whiteColor];
    [_nextbtn addTarget:self action:@selector(nextpage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_nextbtn];
    //
    UILabel* name=[[UILabel alloc]initWithFrame:CGRectMake(50, 85, 35, 21)];
    name.text=@"姓名";
    [self.view addSubview:name];
    //
    _NameTextfield=[[UITextField alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width-170, 80, 120, 30)];
    _NameTextfield.font=[UIFont systemFontOfSize:14.0];
    _NameTextfield.borderStyle=UITextBorderStyleLine;
    _NameTextfield.textAlignment=NSTextAlignmentRight;
    _NameTextfield.clearButtonMode=UITextFieldViewModeAlways;
    [self.view addSubview:_NameTextfield];
    //
    UILabel* sex=[[UILabel alloc]initWithFrame:CGRectMake(50, 125, 35, 21)];
    sex.text=@"性别";
    [self.view addSubview:sex];
    //
    _SexSegment=[[UISegmentedControl alloc]initWithItems:@[@"男", @"女"]];
    _SexSegment.frame=CGRectMake(SCREEN_SIZE.width-120, 121, 57, 29);
    _SexSegment.selectedSegmentIndex=0;
    [self.view addSubview: _SexSegment];
    //
    UILabel* area=[[UILabel alloc]initWithFrame:CGRectMake(50, 165, 87, 21)];
    area.text=@"高考所在地";
    [self.view addSubview:area];
    //
    UIButton* btn=[[UIButton alloc]initWithFrame:CGRectMake(140, 165, 21, 21)];
    [btn setTitle:@">" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:19.0];
    btn.backgroundColor=[UIColor whiteColor];
    [btn addTarget:self action:@selector(chooseExamPosition:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    //
    _ExamArea=[[UITextView alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width-210, 157, 147, 40)];
    _ExamArea.font=[UIFont systemFontOfSize:14.0];
    _ExamArea.textAlignment=NSTextAlignmentCenter;
    _ExamArea.editable=NO;
    [self.view addSubview:_ExamArea];
    //
    UILabel* year=[[UILabel alloc]initWithFrame:CGRectMake(50, 210, 70, 21)];
    year.text=@"入学年份";
    [self.view addSubview:year];
    //
    _GradeTextfield=[[UITextField alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width-170, 205, 120, 30)];
    _GradeTextfield.font=[UIFont systemFontOfSize:14.0];
    _GradeTextfield.borderStyle=UITextBorderStyleLine;
    _GradeTextfield.textAlignment=NSTextAlignmentRight;
    _GradeTextfield.clearButtonMode=UITextFieldViewModeAlways;
    [self.view addSubview:_GradeTextfield];
    //
    UILabel* tip1=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_SIZE.width-349)/2, SCREEN_SIZE.height/2, 349, 17)];
    tip1.font=[UIFont systemFontOfSize:14.0];
    tip1.textColor=[UIColor redColor];
    tip1.text=@"*由于高考改革，为保证推荐结果正确，请正确填写信息";
    [self.view addSubview:tip1];
    //
    UILabel* tip2=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_SIZE.width-229)/2, SCREEN_SIZE.height/2+30, 229, 17)];
    tip2.font=[UIFont systemFontOfSize:14.0];
    tip2.textColor=[UIColor blackColor];
    tip2.text=@"注册即代表你已同意掌课宝用户协议";
    [self.view addSubview:tip2];
}
-(void)upload{
//    if(_Interest.count==0){
//        [self showMessage:@"未选择标签!"];
//        return;
//    }
    if (_ExamArea.text==nil || _NameTextfield.text==nil  || _GradeTextfield.text==nil) {
        [self showMessage:@"信息不完整!"];
        return;
    }
    NetWorkManager* manager=[NetWorkManager sharedManager];
    [manager.requestSerializer setValue:_token forHTTPHeaderField:@"token"];
    //    _tags=[[NSMutableDictionary alloc]initWithCapacity:0];
    //    for (NSInteger i=0;i<_Interest.count; i++) {
    //        NSString* key=[NSString stringWithFormat:@"%ld",i];
    //        [_tags setObject:[_Interest objectAtIndex:i] forKey:key];
    //    }
    self->_message=@{@"name" : self->_NameTextfield.text,@"sex":[self->_SexSegment titleForSegmentAtIndex:[self->_SexSegment selectedSegmentIndex]],@"area2" : self->_ExamArea.text,@"grade" : self->_GradeTextfield.text/*,@"area1" : _SchoArea.text,@"school" : _SchoolTextfield.text,@"class" : _ClassTextfield.text*/};
    NSLog(@"%@",self->_message);
    //dispatch_semaphore_t sema = dispatch_semaphore_create(2);
    dispatch_group_t group=dispatch_group_create();
    dispatch_queue_t queue =dispatch_queue_create("upload", DISPATCH_QUEUE_CONCURRENT);//异步队列
    //上传已选择标签任务(字符串字典)
    dispatch_group_async(group, queue, ^{
        dispatch_group_enter(group);
        NSString *url=@"https://test.extlife.xyz:8443/userinfo/setusertags";
        [manager POST:url parameters:self->_tags progress:^(NSProgress * _Nonnull uploadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject){
            NSLog(@"success");
            NSLog(@"%@",responseObject);
            dispatch_group_leave(group);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"failure");
            return;
        }];
        NSLog(@"上传标签,%@",[NSThread currentThread]);
    });
    //上传个人信息任务
    dispatch_group_async(group,queue,^{
        dispatch_group_enter(group);
            NSLog(@"上传信息,%@",[NSThread currentThread]);
            NSString* url=@"https://test.extlife.xyz:8443/userinfo/setuserinfo";
            [manager POST:url parameters:self->_message progress:^(NSProgress * _Nonnull uploadProgress) {
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject){
                NSLog(@"success");
                NSLog(@"%@",responseObject);
                dispatch_group_leave(group);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"failure");
                //dispatch_group_leave(group);
            }];
    });
    //网络请求成功结束后跳转
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        //跳转到第三页
        [self.view removeFromSuperview];
        [self.parentViewController.view addSubview:self.parentViewController.childViewControllers[2].view];
    });
}
-(void)prepage{
    [self.view removeFromSuperview];
    [self.parentViewController.view addSubview:self.parentViewController.childViewControllers[0].view];
}
-(void)nextpage{
    [self.view removeFromSuperview];
    [self.parentViewController.view addSubview:self.parentViewController.childViewControllers[2].view];
}
//选择省市区
-(void)chooseExamPosition:(UIButton*)button{
    [[MOFSPickerManager shareManger] showMOFSAddressPickerWithTitle:nil cancelTitle:@"取消" commitTitle:@"完成" commitBlock:^(NSString *address, NSString *zipcode) {
        NSString* str=nil;
        self->_Array =[address componentsSeparatedByString:@"-"];
        str=[NSString stringWithFormat:@"%@ %@ %@",self->_Array[0],self->_Array[1],self->_Array[2]];
        self->_ExamArea.text=str;
    } cancelBlock:^{
    }];
}
//控制器即将显示时
- (void)viewWillAppear:(BOOL)animated{
    [_button setBackgroundColor:[UIColor blueColor]];
    NSDictionary *dict = @{@"view":self};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeView" object:nil userInfo:dict];
    NSLog(@"2 appear");
}
//控制器消失
- (void)viewWillDisappear:(BOOL)animated{
    [_button setBackgroundColor:[UIColor grayColor]];
    NSLog(@"2 disappear");
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
        return  [_Array count];
    }
    return [_Array count];
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
    text.text = [_Array objectAtIndex:row];
    [view addSubview:text];
    //隐藏上下直线
    [_picker.subviews objectAtIndex:1].backgroundColor = [UIColor clearColor];
    [_picker.subviews objectAtIndex:2].backgroundColor = [UIColor clearColor];
    return view;
}
//显示的标题
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *str = [_Array objectAtIndex:row];
    return str;
}
//显示的标题字体、颜色等属性
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *str = [_Array objectAtIndex:row];
    NSMutableAttributedString *AttributedString = [[NSMutableAttributedString alloc]initWithString:str];
    [AttributedString addAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18], NSForegroundColorAttributeName:[UIColor whiteColor]} range:NSMakeRange(0, [AttributedString  length])];
    return AttributedString;
}//NS_AVAILABLE_IOS(6_0);
//被选择的行
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"HANG%@",[_Array objectAtIndex:row]);
}



@end
